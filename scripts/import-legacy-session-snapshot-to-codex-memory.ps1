param(
    [datetime]$ReferenceTime = (Get-Date),
    [switch]$IncludeCurrentDay,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

function Get-RepoRoot {
    return (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
}

function Set-FileContent {
    param(
        [string]$Path,
        [string[]]$Lines
    )

    if ($DryRun) {
        return
    }

    $dir = Split-Path -Parent $Path
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    Set-Content -Path $Path -Value $Lines -Encoding UTF8
}

function Get-RelativePath {
    param(
        [string]$BasePath,
        [string]$TargetPath
    )

    $baseUri = [System.Uri]((Resolve-Path $BasePath).Path.TrimEnd('\') + '\')
    $targetUri = [System.Uri](Resolve-Path $TargetPath).Path
    $relative = $baseUri.MakeRelativeUri($targetUri).ToString()
    return [System.Uri]::UnescapeDataString($relative).Replace('/', '\')
}

function Get-Sha1 {
    param([string]$Text)

    $sha1 = [System.Security.Cryptography.SHA1]::Create()
    try {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($Text)
        $hash = $sha1.ComputeHash($bytes)
        return ([System.BitConverter]::ToString($hash)).Replace("-", "").ToLowerInvariant()
    }
    finally {
        $sha1.Dispose()
    }
}

function Normalize-Text {
    param([string]$Text)

    if ($null -eq $Text) {
        return ""
    }

    $normalized = ($Text -replace "`r", "").Trim()
    $normalized = $normalized -replace "\s+", " "
    return $normalized.Trim()
}

function Join-FirstTexts {
    param(
        [string[]]$Texts,
        [int]$MaxCount = 2
    )

    $picked = @($Texts | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -Unique | Select-Object -First $MaxCount)
    if ($picked.Count -eq 0) {
        return ""
    }
    return ($picked -join "；")
}

function Parse-Heading {
    param([string]$Line)

    if ($Line -match '^## 本轮更新（(?<day>\d{4}-\d{2}-\d{2})）(?:- (?<title>.*?))?(?: <!-- session-turn-id: (?<sid>[^>]+) -->)?$') {
        return [PSCustomObject]@{
            DayId = $Matches["day"]
            Title = Normalize-Text -Text $Matches["title"]
            SessionId = Normalize-Text -Text $Matches["sid"]
        }
    }

    return $null
}

function Get-ItemsFromBody {
    param([string[]]$BodyLines)

    $items = New-Object System.Collections.Generic.List[object]
    $currentLabel = ""
    $currentDetails = New-Object System.Collections.Generic.List[string]

    foreach ($line in $BodyLines) {
        if ([string]::IsNullOrWhiteSpace($line) -or $line -match '^快照检查：') {
            continue
        }

        if ($line -match '^\d+\.\s*(.+)$') {
            if (-not [string]::IsNullOrWhiteSpace($currentLabel) -or $currentDetails.Count -gt 0) {
                $items.Add([PSCustomObject]@{
                        Label = $currentLabel
                        Details = @($currentDetails)
                    }) | Out-Null
            }
            $currentLabel = Normalize-Text -Text $Matches[1]
            $currentDetails = New-Object System.Collections.Generic.List[string]
            continue
        }

        if ($line -match '^\s*-\s*(.+)$') {
            $detail = Normalize-Text -Text $Matches[1]
            if (-not [string]::IsNullOrWhiteSpace($detail)) {
                $currentDetails.Add($detail) | Out-Null
            }
            continue
        }

        if ($line -match '^\s+\d+\)\s*(.+)$') {
            $detail = Normalize-Text -Text $Matches[1]
            if (-not [string]::IsNullOrWhiteSpace($detail)) {
                $currentDetails.Add($detail) | Out-Null
            }
            continue
        }

        $detail = Normalize-Text -Text $line
        if (-not [string]::IsNullOrWhiteSpace($detail)) {
            $currentDetails.Add($detail) | Out-Null
        }
    }

    if (-not [string]::IsNullOrWhiteSpace($currentLabel) -or $currentDetails.Count -gt 0) {
        $items.Add([PSCustomObject]@{
                Label = $currentLabel
                Details = @($currentDetails)
            }) | Out-Null
    }

    return $items.ToArray()
}

function Select-ItemText {
    param(
        [object[]]$Items,
        [string[]]$Patterns,
        [int]$MaxDetailCount = 2
    )

    foreach ($pattern in $Patterns) {
        foreach ($item in $Items) {
            $label = [string]$item.Label
            if ($label -match $pattern) {
                $joined = Join-FirstTexts -Texts @($item.Details) -MaxCount $MaxDetailCount
                if (-not [string]::IsNullOrWhiteSpace($joined)) {
                    return $joined
                }
                if (-not [string]::IsNullOrWhiteSpace($label)) {
                    return $label
                }
            }
        }
    }

    return ""
}

function Get-FirstMeaningfulText {
    param([object[]]$Items)

    foreach ($item in $Items) {
        $joined = Join-FirstTexts -Texts @($item.Details) -MaxCount 2
        if (-not [string]::IsNullOrWhiteSpace($joined)) {
            return $joined
        }
        if (-not [string]::IsNullOrWhiteSpace($item.Label)) {
            return [string]$item.Label
        }
    }

    return ""
}

function Get-BlockTimestamp {
    param(
        [pscustomobject]$Block,
        [int]$FallbackIndex
    )

    if (-not [string]::IsNullOrWhiteSpace($Block.SessionId) -and $Block.SessionId -match '^(?<stamp>\d{8}-\d{9})$') {
        return [datetime]::ParseExact($Matches["stamp"], "yyyyMMdd-HHmmssfff", $null)
    }

    $day = [datetime]::ParseExact($Block.DayId, "yyyy-MM-dd", $null)
    return $day.AddSeconds($FallbackIndex)
}

function New-DailyMemoryLines {
    param(
        [string]$DayId,
        [string]$MonthId,
        [string]$Timestamp,
        [object[]]$Blocks
    )

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add("# $DayId 每日记忆") | Out-Null
    $lines.Add("") | Out-Null
    $lines.Add("- 最后更新: $Timestamp") | Out-Null
    $lines.Add("- 所属月份: $MonthId") | Out-Null
    $lines.Add('- 状态: 历史导入；已由旧工作快照迁移生成，并纳入 `记忆总览.md`。') | Out-Null
    $lines.Add('- 导入来源: `workspace_state/core/session-snapshot.md` 与 `workspace_state/logs/session-history/`') | Out-Null
    $lines.Add('- 时间说明: 带 `session-turn-id` 的记录使用原时间；缺失时按当日旧快照顺序补齐时间戳。') | Out-Null
    $lines.Add("") | Out-Null
    $lines.Add("## 回合记录") | Out-Null

    if ($Blocks.Count -eq 0) {
        $lines.Add("- 当前暂无回合记录。") | Out-Null
        return $lines.ToArray()
    }

    $fallbackIndex = 0
    foreach ($block in $Blocks) {
        $fallbackIndex++
        $entryTime = Get-BlockTimestamp -Block $block -FallbackIndex $fallbackIndex

        $lines.Add("") | Out-Null
        $lines.Add("### $($entryTime.ToString('yyyy-MM-dd HH:mm:ss'))") | Out-Null
        $lines.Add("- 主题: $($block.Topic)") | Out-Null
        $lines.Add("- 总结: $($block.Summary)") | Out-Null
        if (-not [string]::IsNullOrWhiteSpace($block.Decision)) {
            $lines.Add("- 决策/约束: $($block.Decision)") | Out-Null
        }
        if (-not [string]::IsNullOrWhiteSpace($block.FollowUp)) {
            $lines.Add("- 待跟进: $($block.FollowUp)") | Out-Null
        }
        $lines.Add(('- 来源: 从 `{0}` 导入旧工作快照。' -f (($block.SourceRel).Replace('\', '/')))) | Out-Null
    }

    return $lines.ToArray()
}

$repoRoot = Get-RepoRoot
$memoryRoot = Join-Path $repoRoot ".codex/memory"
$currentDayId = $ReferenceTime.ToString("yyyy-MM-dd")
$timestamp = $ReferenceTime.ToString("yyyy-MM-dd HH:mm:ss")

$historyDir = Join-Path $repoRoot "workspace_state/logs/session-history"
$legacyFiles = @()
if (Test-Path $historyDir) {
    $legacyFiles += @(Get-ChildItem -Path $historyDir -Filter "*.md" | Sort-Object Name)
}
$legacySnapshotPath = Join-Path $repoRoot "workspace_state/core/session-snapshot.md"
if (Test-Path $legacySnapshotPath) {
    $legacyFiles += @(Get-Item $legacySnapshotPath)
}

if ($legacyFiles.Count -eq 0) {
    throw "No legacy session snapshot sources found."
}

$allBlocks = New-Object System.Collections.Generic.List[object]
$sourceSeq = 0

foreach ($file in $legacyFiles) {
    $lines = @(Get-Content -Path $file.FullName)
    $current = $null

    foreach ($line in $lines) {
        $meta = Parse-Heading -Line $line
        if ($null -ne $meta) {
            if ($null -ne $current) {
                $allBlocks.Add([PSCustomObject]$current) | Out-Null
            }

            $sourceSeq++
            $current = @{
                DayId = $meta.DayId
                Title = $meta.Title
                SessionId = $meta.SessionId
                BodyLines = New-Object System.Collections.Generic.List[string]
                SourceRel = Get-RelativePath -BasePath $repoRoot -TargetPath $file.FullName
                SourceSeq = $sourceSeq
            }
            continue
        }

        if ($null -ne $current) {
            $current.BodyLines.Add([string]$line) | Out-Null
        }
    }

    if ($null -ne $current) {
        $allBlocks.Add([PSCustomObject]$current) | Out-Null
    }
}

$unique = @{}
foreach ($block in $allBlocks) {
    if ([string]::IsNullOrWhiteSpace($block.DayId)) {
        continue
    }

    if (-not $IncludeCurrentDay -and $block.DayId -ge $currentDayId) {
        continue
    }

    $bodyKey = @($block.BodyLines | Where-Object { $_ -notmatch '^快照检查：' }) -join "`n"
    $identity = if (-not [string]::IsNullOrWhiteSpace($block.SessionId)) {
        "sid:$($block.SessionId)"
    }
    else {
        "hash:$(Get-Sha1 -Text "$($block.DayId)|$($block.Title)|$bodyKey")"
    }

    if ($unique.ContainsKey($identity)) {
        continue
    }

    $items = @(Get-ItemsFromBody -BodyLines @($block.BodyLines))
    $topic = if (-not [string]::IsNullOrWhiteSpace($block.Title)) {
        $block.Title
    }
    else {
        Get-FirstMeaningfulText -Items $items
    }
    if ([string]::IsNullOrWhiteSpace($topic)) {
        $topic = "旧工作快照历史导入"
    }

    $summary = Select-ItemText -Items $items -Patterns @(
        '本轮完成', '本轮动作', '已执行动作', '本轮交付', '本轮实现', '本轮修正',
        '本轮结论', '当前判断', '本轮判断', '本轮恢复', '本轮维护', '本轮治理',
        '本轮核查', '本轮执行', '本轮产出', '本轮同步', '本轮文档', '当前有效口径',
        '当前收敛判断', '当前状态', '校验结果'
    ) -MaxDetailCount 2
    if ([string]::IsNullOrWhiteSpace($summary)) {
        $summary = Get-FirstMeaningfulText -Items $items
    }
    if ([string]::IsNullOrWhiteSpace($summary)) {
        $summary = "已从旧工作快照导入该历史回合。"
    }

    $decision = Select-ItemText -Items $items -Patterns @(
        '决策', '约束', '当前边界', '建议边界', '当前有效口径', '当前状态',
        '收敛门禁', '门禁', '建议', '边界'
    ) -MaxDetailCount 2

    $followUp = Select-ItemText -Items $items -Patterns @(
        '待跟进', '待验证', '下一步', '下一轮', '衔接点', '开放项', '关注'
    ) -MaxDetailCount 2

    $unique[$identity] = [PSCustomObject]@{
        Id = $identity
        DayId = $block.DayId
        Topic = $topic
        Summary = $summary
        Decision = $decision
        FollowUp = $followUp
        SessionId = $block.SessionId
        SourceRel = $block.SourceRel
        SourceSeq = $block.SourceSeq
    }
}

$grouped = @{}
foreach ($block in $unique.Values | Sort-Object DayId, SourceSeq) {
    if (-not $grouped.ContainsKey($block.DayId)) {
        $grouped[$block.DayId] = New-Object System.Collections.Generic.List[object]
    }
    $grouped[$block.DayId].Add($block) | Out-Null
}

$dailyPaths = New-Object System.Collections.Generic.List[string]
foreach ($dayId in @($grouped.Keys | Sort-Object)) {
    $monthId = $dayId.Substring(0, 7)
    $dayPath = Join-Path $memoryRoot "$monthId\$dayId-每日记忆.md"
    $lines = New-DailyMemoryLines -DayId $dayId -MonthId $monthId -Timestamp $timestamp -Blocks ($grouped[$dayId].ToArray())
    Set-FileContent -Path $dayPath -Lines $lines
    $dailyPaths.Add($dayPath) | Out-Null
}

Write-Host "IMPORTED DAYS: $($dailyPaths.Count)"
Write-Host "IMPORTED TURNS: $($unique.Count)"
if ($dailyPaths.Count -gt 0) {
    Write-Host "FIRST DAY: $((@($grouped.Keys | Sort-Object))[0])"
    Write-Host "LAST DAY: $((@($grouped.Keys | Sort-Object))[-1])"
}
