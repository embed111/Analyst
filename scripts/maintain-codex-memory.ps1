param(
    [datetime]$ReferenceTime = (Get-Date),
    [Alias("WhitelistDirs")]
    [string[]]$AllowedRelativeDirs = @(),
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

function Get-RepoRoot {
    return (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
}

function Ensure-Directory {
    param(
        [string]$Path,
        [System.Collections.Generic.List[string]]$Actions
    )

    if (Test-Path $Path) {
        return
    }

    $Actions.Add("CREATE dir $Path") | Out-Null
    if (-not $DryRun) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Set-FileContent {
    param(
        [string]$Path,
        [string[]]$Lines
    )

    if ($DryRun) {
        return
    }

    Set-Content -Path $Path -Value $Lines -Encoding UTF8
}

function Ensure-File {
    param(
        [string]$Path,
        [string[]]$TemplateLines,
        [System.Collections.Generic.List[string]]$Actions
    )

    if (Test-Path $Path) {
        return
    }

    $Actions.Add("CREATE file $Path") | Out-Null
    Set-FileContent -Path $Path -Lines $TemplateLines
}

function Write-FileIfChanged {
    param(
        [string]$Path,
        [string[]]$Lines,
        [System.Collections.Generic.List[string]]$Actions
    )

    $needsWrite = $true
    if (Test-Path $Path) {
        $existing = @(Get-Content -Path $Path)
        if ($existing.Count -eq $Lines.Count) {
            $needsWrite = $false
            for ($i = 0; $i -lt $Lines.Count; $i++) {
                if ($existing[$i] -ne $Lines[$i]) {
                    $needsWrite = $true
                    break
                }
            }
        }
    }

    if (-not $needsWrite) {
        return
    }

    $action = if (Test-Path $Path) { "UPDATE file $Path" } else { "CREATE file $Path" }
    $Actions.Add($action) | Out-Null
    Set-FileContent -Path $Path -Lines $Lines
}

function Normalize-Text {
    param([string]$Text)

    if ($null -eq $Text) {
        return ""
    }

    $normalized = ($Text -replace "`r", "").Trim()
    $normalized = [regex]::Replace($normalized, "\s+", " ")
    return $normalized.Trim()
}

function Shorten-Text {
    param(
        [string]$Text,
        [int]$MaxLength = 96
    )

    $normalized = Normalize-Text -Text $Text
    if ([string]::IsNullOrWhiteSpace($normalized)) {
        return ""
    }

    if ($normalized.Length -le $MaxLength) {
        return $normalized
    }

    return ($normalized.Substring(0, $MaxLength - 1) + "...")
}

function New-GlobalOverviewTemplate {
    param(
        [string]$CurrentMonthId,
        [string]$Timestamp
    )

    return @(
        "# 全局记忆总览",
        "",
        "- 最后更新: $Timestamp",
        "- 当前进行中月份: $CurrentMonthId",
        "- 归档范围: 仅保留已完成归档的历史月份；当前月份在月切前不写入本文件。",
        "",
        "## 全局内容总结",
        "- 当前暂无已归档月份。"
    )
}

function New-MonthOverviewTemplate {
    param(
        [string]$MonthId,
        [string]$Timestamp
    )

    return @(
        "# $MonthId 记忆总览",
        "",
        "- 最后更新: $Timestamp",
        "- 归档范围: 仅保留已完成归档的历史日期；当天在日切前不写入本文件。",
        "",
        "## 月度内容总结",
        "- 当前暂无已归档内容。"
    )
}

function New-DailyTemplate {
    param(
        [string]$DayId,
        [string]$MonthId,
        [string]$Timestamp
    )

    return @(
        "# $DayId 每日记忆",
        "",
        "- 最后更新: $Timestamp",
        "- 所属月份: $MonthId",
        "- 状态: 当日增量；日切后归档到 `记忆总览.md`。",
        "",
        "## 回合记录",
        "- 当前暂无回合记录。"
    )
}

function Normalize-AllowedMonthIds {
    param([string[]]$AllowedDirs)

    $result = New-Object System.Collections.Generic.List[string]
    foreach ($rawDir in $AllowedDirs) {
        $parts = @($rawDir -split "[,;]")
        foreach ($part in $parts) {
            $normalized = Normalize-Text -Text $part
            if ([string]::IsNullOrWhiteSpace($normalized)) {
                continue
            }

            $normalized = $normalized.Replace("/", "\")
            while ($normalized.StartsWith(".\")) {
                $normalized = $normalized.Substring(2)
            }
            $normalized = $normalized.Trim("\")

            if ($normalized.Contains("\")) {
                throw "AllowedRelativeDirs only supports top-level month directories like YYYY-MM: $part"
            }
            if ($normalized -notmatch "^\d{4}-\d{2}$") {
                throw "AllowedRelativeDirs only supports month directory ids like YYYY-MM: $part"
            }
            if (-not $result.Contains($normalized)) {
                $result.Add($normalized) | Out-Null
            }
        }
    }

    return $result.ToArray()
}

function Get-ScanScopeLabel {
    param(
        [string[]]$ExplicitMonthIds,
        [string]$CurrentMonthId
    )

    if ($ExplicitMonthIds.Count -eq 0) {
        return "自动识别 `.codex/memory/` 下全部 `YYYY-MM` 月目录。"
    }

    $label = "仅扫描白名单目录：{0}" -f ($ExplicitMonthIds -join ", ")
    if ($ExplicitMonthIds -notcontains $CurrentMonthId) {
        return "$label；并自动补含当前月 $CurrentMonthId。"
    }

    return "$label。"
}

function Get-DailyEntries {
    param(
        [string]$DailyPath,
        [string]$MonthId,
        [string]$DayId
    )

    $entries = New-Object System.Collections.Generic.List[object]
    $lines = @(Get-Content -Path $DailyPath)
    $current = $null

    foreach ($line in $lines) {
        if ($line -match "^### (\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})$") {
            if ($null -ne $current) {
                $entries.Add([PSCustomObject]$current) | Out-Null
            }
            $current = @{
                Timestamp = $Matches[1]
                MonthId = $MonthId
                DayId = $DayId
                Topic = ""
                Summary = ""
                Decision = ""
                FollowUp = ""
            }
            continue
        }

        if ($null -eq $current) {
            continue
        }

        if ($line -match "^- 主题:\s*(.+)$") {
            $current.Topic = $Matches[1]
            continue
        }
        if ($line -match "^- 总结:\s*(.+)$") {
            $current.Summary = $Matches[1]
            continue
        }
        if ($line -match "^- 决策/约束:\s*(.+)$") {
            $current.Decision = $Matches[1]
            continue
        }
        if ($line -match "^- 待跟进:\s*(.+)$") {
            $current.FollowUp = $Matches[1]
            continue
        }
    }

    if ($null -ne $current) {
        $entries.Add([PSCustomObject]$current) | Out-Null
    }

    return $entries.ToArray()
}

function Get-FrequentTexts {
    param(
        [string[]]$Texts,
        [int]$MaxLength = 120
    )

    $counts = @{}
    foreach ($text in $Texts) {
        $normalized = Shorten-Text -Text $text -MaxLength $MaxLength
        if ([string]::IsNullOrWhiteSpace($normalized)) {
            continue
        }
        if (-not $counts.ContainsKey($normalized)) {
            $counts[$normalized] = 0
        }
        $counts[$normalized] += 1
    }

    return @(
        $counts.GetEnumerator() |
            ForEach-Object {
                [PSCustomObject]@{
                    Text = $_.Key
                    Count = $_.Value
                }
            } |
            Sort-Object `
                @{ Expression = "Count"; Descending = $true }, `
                @{ Expression = "Text"; Descending = $false }
    )
}

function Add-SectionLines {
    param(
        [System.Collections.Generic.List[string]]$Lines,
        [string]$Heading,
        [string[]]$Items,
        [string]$EmptyLine
    )

    $Lines.Add($Heading) | Out-Null
    if ($Items.Count -eq 0) {
        $Lines.Add("- $EmptyLine") | Out-Null
        return
    }

    foreach ($item in $Items) {
        $Lines.Add([string]$item) | Out-Null
    }
}

function Get-UniqueTexts {
    param(
        [string[]]$Texts,
        [int]$MaxItems = 3,
        [int]$MaxLength = 48,
        [string]$SkipExactText = ""
    )

    $lines = New-Object System.Collections.Generic.List[string]
    foreach ($text in $Texts) {
        $normalized = Shorten-Text -Text $text -MaxLength $MaxLength
        if ([string]::IsNullOrWhiteSpace($normalized)) {
            continue
        }
        if (-not [string]::IsNullOrWhiteSpace($SkipExactText) -and $normalized -eq $SkipExactText) {
            continue
        }
        if (-not $lines.Contains($normalized)) {
            $lines.Add($normalized) | Out-Null
        }
        if ($lines.Count -ge $MaxItems) {
            break
        }
    }
    return $lines.ToArray()
}

function Join-CompactTexts {
    param(
        [string[]]$Texts,
        [int]$ShowCount = 3,
        [string]$EmptyText = "无"
    )

    if ($Texts.Count -eq 0) {
        return $EmptyText
    }

    $picked = @($Texts | Select-Object -First $ShowCount)
    $suffix = if ($Texts.Count -gt $ShowCount) { " 等 $($Texts.Count) 项" } else { "" }
    return (($picked -join "、") + $suffix)
}

function New-MonthFocusRules {
    return @(
        [PSCustomObject]@{ Order = 1; Label = "需求收敛与文档迭代"; Patterns = @("需求", "需求文档", "需求详情", "需求概述", "收敛", "澄清") }
        [PSCustomObject]@{ Order = 2; Label = "原型预览与信息架构收口"; Patterns = @("原型", "参考图", "HTML", "预稿", "草图", "信息架构") }
        [PSCustomObject]@{ Order = 3; Label = "执行提示词编写与分发"; Patterns = @("提示词", "开工", "执行指令", "分发") }
        [PSCustomObject]@{ Order = 4; Label = "8090 live 验收与运行态取证"; Patterns = @("8090", "live", "验收", "运行态", "核验", "复核", "取证", "截图") }
        [PSCustomObject]@{ Order = 5; Label = "跨工作区同步与一致性校验"; Patterns = @("同步", "SHA256", "哈希", "校验", "一致性") }
        [PSCustomObject]@{ Order = 6; Label = "工作区治理与记忆机制维护"; Patterns = @("目录治理", "OpenClaw", "记忆", "归档", "恢复", "工作区治理", "maintain-codex-memory") }
    )
}

function New-MonthModuleRules {
    return @(
        [PSCustomObject]@{ Order = 1; Label = "角色中心/训练优化"; Patterns = @("角色中心", "训练优化", "训练闭环", "训练中心") }
        [PSCustomObject]@{ Order = 2; Label = "创建角色/能力包"; Patterns = @("创建角色", "角色画像", "能力包", "知识沉淀") }
        [PSCustomObject]@{ Order = 3; Label = "任务中心"; Patterns = @("任务中心", "任务图", "依赖管理", "执行化") }
        [PSCustomObject]@{ Order = 4; Label = "需求与缺陷"; Patterns = @("需求与缺陷", "缺陷", "bug", "DTS-") }
        [PSCustomObject]@{ Order = 5; Label = "发布/版本治理"; Patterns = @("发布", "版本", "评审", "切换") }
        [PSCustomObject]@{ Order = 6; Label = "设置/路径治理"; Patterns = @("根路径", "agent_search_root", '\$root', "路径语义") }
        [PSCustomObject]@{ Order = 7; Label = "工作区目录治理"; Patterns = @("目录治理", "OpenClaw", "目录契约", "目录结构") }
    )
}

function New-MonthDeliverableRules {
    return @(
        [PSCustomObject]@{ Order = 1; Label = "需求文档"; Patterns = @("需求文档", "需求详情", "需求概述") }
        [PSCustomObject]@{ Order = 2; Label = "执行提示词"; Patterns = @("提示词", "开工", "执行指令") }
        [PSCustomObject]@{ Order = 3; Label = "原型/预览稿"; Patterns = @("原型", "参考图", "HTML", "预稿", "草图", "PNG") }
        [PSCustomObject]@{ Order = 4; Label = "验收截图与运行态证据"; Patterns = @("截图", "live", "验收", "运行态", "取证", "核验", "复核") }
        [PSCustomObject]@{ Order = 5; Label = "跨工作区同步与哈希校验"; Patterns = @("同步", "SHA256", "哈希", "校验", "一致性") }
    )
}

function Get-RuleMatchItems {
    param(
        [object[]]$Entries,
        [object[]]$Rules,
        [int]$MaxItems = 4
    )

    $items = New-Object System.Collections.Generic.List[object]
    foreach ($rule in $Rules) {
        $count = 0
        foreach ($entry in $Entries) {
            $combinedText = Normalize-Text -Text ([string]::Join(" ", @(
                $entry.Topic,
                $entry.Summary,
                $entry.Decision,
                $entry.FollowUp
            )))
            if ([string]::IsNullOrWhiteSpace($combinedText)) {
                continue
            }

            $matched = $false
            foreach ($pattern in $rule.Patterns) {
                if ($combinedText -match $pattern) {
                    $matched = $true
                    break
                }
            }

            if ($matched) {
                $count += 1
            }
        }

        if ($count -gt 0) {
            $items.Add([PSCustomObject]@{
                Label = $rule.Label
                Count = $count
                Order = $rule.Order
            }) | Out-Null
        }
    }

    return @(
        $items |
            Sort-Object `
                @{ Expression = "Count"; Descending = $true }, `
                @{ Expression = "Order"; Descending = $false }, `
                @{ Expression = "Label"; Descending = $false } |
            Select-Object -First $MaxItems
    )
}

function Get-MonthNarrativeParts {
    param([object[]]$Entries)

    $parts = New-Object System.Collections.Generic.List[string]

    $focusLabels = @((Get-RuleMatchItems -Entries $Entries -Rules (New-MonthFocusRules) -MaxItems 5) | ForEach-Object { $_.Label })
    $moduleLabels = @((Get-RuleMatchItems -Entries $Entries -Rules (New-MonthModuleRules) -MaxItems 4) | ForEach-Object { $_.Label })
    $deliverableLabels = @((Get-RuleMatchItems -Entries $Entries -Rules (New-MonthDeliverableRules) -MaxItems 5) | ForEach-Object { $_.Label })

    if ($focusLabels.Count -gt 0) {
        $parts.Add("本月主线：$(Join-CompactTexts -Texts $focusLabels -ShowCount 5)") | Out-Null
    }
    if ($moduleLabels.Count -gt 0) {
        $parts.Add("重点模块：$(Join-CompactTexts -Texts $moduleLabels -ShowCount 4)") | Out-Null
    }
    if ($deliverableLabels.Count -gt 0) {
        $parts.Add("主要产出：$(Join-CompactTexts -Texts $deliverableLabels -ShowCount 5)") | Out-Null
    }

    return $parts.ToArray()
}

function Get-DayNarrativeParts {
    param([object[]]$Entries)

    $parts = New-Object System.Collections.Generic.List[string]

    $focusLabels = @((Get-RuleMatchItems -Entries $Entries -Rules (New-MonthFocusRules) -MaxItems 3) | ForEach-Object { $_.Label })
    $moduleLabels = @((Get-RuleMatchItems -Entries $Entries -Rules (New-MonthModuleRules) -MaxItems 3) | ForEach-Object { $_.Label })
    $deliverableLabels = @((Get-RuleMatchItems -Entries $Entries -Rules (New-MonthDeliverableRules) -MaxItems 3) | ForEach-Object { $_.Label })
    $summaries = @(Get-UniqueTexts -Texts @($Entries | ForEach-Object { $_.Summary }) -MaxItems 2 -MaxLength 56 -SkipExactText "已从旧工作快照导入该历史回合。")

    if ($focusLabels.Count -gt 0) {
        $parts.Add("当天主线：$(Join-CompactTexts -Texts $focusLabels -ShowCount 3)") | Out-Null
    }
    if ($moduleLabels.Count -gt 0) {
        $parts.Add("涉及模块：$(Join-CompactTexts -Texts $moduleLabels -ShowCount 3)") | Out-Null
    }
    if ($deliverableLabels.Count -gt 0) {
        $parts.Add("主要产出：$(Join-CompactTexts -Texts $deliverableLabels -ShowCount 3)") | Out-Null
    }
    if ($summaries.Count -gt 0) {
        $parts.Add("结果：$(Join-CompactTexts -Texts $summaries -ShowCount 2)") | Out-Null
    }

    return $parts.ToArray()
}

function Get-DaySummaryLines {
    param([object[]]$Entries)

    $grouped = $Entries | Group-Object DayId | Sort-Object Name
    $lines = New-Object System.Collections.Generic.List[string]

    foreach ($group in $grouped) {
        $dayEntries = @($group.Group | Sort-Object Timestamp)
        $narrativeParts = @(Get-DayNarrativeParts -Entries $dayEntries)

        $parts = New-Object System.Collections.Generic.List[string]
        $parts.Add("$($group.Name)：$($dayEntries.Count) 回合") | Out-Null
        if ($narrativeParts.Count -gt 0) {
            foreach ($narrativePart in $narrativeParts) {
                $parts.Add($narrativePart) | Out-Null
            }
        }
        else {
            $topics = @(Get-UniqueTexts -Texts @($dayEntries | ForEach-Object { $_.Topic }) -MaxItems 3 -MaxLength 28)
            $summaries = @(Get-UniqueTexts -Texts @($dayEntries | ForEach-Object { $_.Summary }) -MaxItems 2 -MaxLength 56 -SkipExactText "已从旧工作快照导入该历史回合。")
            if ($topics.Count -gt 0) {
                $parts.Add("主要事项：$(Join-CompactTexts -Texts $topics -ShowCount 3)") | Out-Null
            }
            if ($summaries.Count -gt 0) {
                $parts.Add("结果：$(Join-CompactTexts -Texts $summaries -ShowCount 2)") | Out-Null
            }
        }

        $lines.Add("- $([string]::Join('；', @($parts)))") | Out-Null
    }

    return $lines.ToArray()
}

function Get-MonthSummaryLines {
    param([object[]]$Entries)

    $grouped = $Entries | Group-Object MonthId | Sort-Object Name
    $lines = New-Object System.Collections.Generic.List[string]

    foreach ($group in $grouped) {
        $monthEntries = @($group.Group | Sort-Object DayId, Timestamp)
        $dayCount = @($monthEntries | Select-Object -ExpandProperty DayId -Unique).Count
        $narrativeParts = @(Get-MonthNarrativeParts -Entries $monthEntries)

        $parts = New-Object System.Collections.Generic.List[string]
        $parts.Add("$($group.Name)：$dayCount 天、$($monthEntries.Count) 回合") | Out-Null
        if ($narrativeParts.Count -gt 0) {
            foreach ($narrativePart in $narrativeParts) {
                $parts.Add($narrativePart) | Out-Null
            }
        }
        else {
            $topics = @(Get-UniqueTexts -Texts @($monthEntries | ForEach-Object { $_.Topic }) -MaxItems 4 -MaxLength 28)
            $summaries = @(Get-UniqueTexts -Texts @($monthEntries | ForEach-Object { $_.Summary }) -MaxItems 2 -MaxLength 60 -SkipExactText "已从旧工作快照导入该历史回合。")
            if ($topics.Count -gt 0) {
                $parts.Add("主要事项：$(Join-CompactTexts -Texts $topics -ShowCount 4)") | Out-Null
            }
            if ($summaries.Count -gt 0) {
                $parts.Add("结果：$(Join-CompactTexts -Texts $summaries -ShowCount 2)") | Out-Null
            }
        }

        $lines.Add("- $([string]::Join('；', @($parts)))") | Out-Null
    }

    return $lines.ToArray()
}

function Get-TextSummaryLines {
    param(
        [object[]]$Items,
        [int]$MaxItems = 6
    )

    $lines = New-Object System.Collections.Generic.List[string]
    foreach ($item in @($Items | Select-Object -First $MaxItems)) {
        $suffix = if ($item.Count -gt 1) { "（出现 $($item.Count) 次）" } else { "" }
        $lines.Add("- $($item.Text)$suffix") | Out-Null
    }
    if ($Items.Count -gt $MaxItems) {
        $lines.Add("- 其余 $($Items.Count - $MaxItems) 条已折叠。") | Out-Null
    }
    return $lines.ToArray()
}

function New-MonthOverviewLines {
    param(
        [string]$MonthId,
        [string]$Timestamp,
        [string]$ScanScopeLabel,
        [string[]]$ArchivedDayIds,
        [object[]]$Entries
    )

    if ($Entries.Count -eq 0) {
        return @(
            "# $MonthId 记忆总览",
            "",
            "- 最后更新: $Timestamp",
            "- 归档范围: 仅保留已完成归档的历史日期；当天在日切前不写入本文件。",
            "- 扫描白名单: $ScanScopeLabel",
            "- 已归档日期数: $($ArchivedDayIds.Count)",
            "- 已归档回合数: 0",
            "",
            "## 月度内容总结",
            "- 当前暂无已归档内容。"
        )
    }

    $decisionItems = @(Get-FrequentTexts -Texts @($Entries | ForEach-Object { $_.Decision }) -MaxLength 120)
    $followUpItems = @(Get-FrequentTexts -Texts @($Entries | ForEach-Object { $_.FollowUp }) -MaxLength 120)

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add("# $MonthId 记忆总览") | Out-Null
    $lines.Add("") | Out-Null
    $lines.Add("- 最后更新: $Timestamp") | Out-Null
    $lines.Add("- 归档范围: 仅保留已完成归档的历史日期；当天在日切前不写入本文件。") | Out-Null
    $lines.Add("- 扫描白名单: $ScanScopeLabel") | Out-Null
    $lines.Add("- 已归档日期数: $($ArchivedDayIds.Count)") | Out-Null
    $lines.Add("- 已归档回合数: $($Entries.Count)") | Out-Null
    $lines.Add("") | Out-Null
    $lines.Add("## 月度内容总结") | Out-Null
    Add-SectionLines -Lines $lines -Heading "### 每日摘要" -Items (Get-DaySummaryLines -Entries $Entries) -EmptyLine "当前暂无可归档日期摘要。"
    $lines.Add("") | Out-Null
    Add-SectionLines -Lines $lines -Heading "### 月内高频决策/约束" -Items (Get-TextSummaryLines -Items $decisionItems) -EmptyLine "当前暂无明确决策/约束。"
    $lines.Add("") | Out-Null
    Add-SectionLines -Lines $lines -Heading "### 月内待跟进" -Items (Get-TextSummaryLines -Items $followUpItems) -EmptyLine "当前暂无持续待跟进事项。"

    return $lines.ToArray()
}

function New-GlobalOverviewLines {
    param(
        [string]$CurrentMonthId,
        [string]$Timestamp,
        [string]$ScanScopeLabel,
        [string[]]$ArchivedMonthIds,
        [object[]]$Entries
    )

    if ($Entries.Count -eq 0) {
        return @(
            "# 全局记忆总览",
            "",
            "- 最后更新: $Timestamp",
            "- 当前进行中月份: $CurrentMonthId",
            "- 归档范围: 仅保留已完成归档的历史月份；当前月份在月切前不写入本文件。",
            "- 扫描白名单: $ScanScopeLabel",
            "- 已归档月份数: $($ArchivedMonthIds.Count)",
            "- 已归档回合数: 0",
            "",
            "## 全局内容总结",
            "- 当前暂无已归档月份。"
        )
    }

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add("# 全局记忆总览") | Out-Null
    $lines.Add("") | Out-Null
    $lines.Add("- 最后更新: $Timestamp") | Out-Null
    $lines.Add("- 当前进行中月份: $CurrentMonthId") | Out-Null
    $lines.Add("- 归档范围: 仅保留已完成归档的历史月份；当前月份在月切前不写入本文件。") | Out-Null
    $lines.Add("- 扫描白名单: $ScanScopeLabel") | Out-Null
    $lines.Add("- 已归档月份数: $($ArchivedMonthIds.Count)") | Out-Null
    $lines.Add("- 已归档回合数: $($Entries.Count)") | Out-Null
    if ($ArchivedMonthIds.Count -gt 0) {
        $lines.Add("- 归档月份范围: $($ArchivedMonthIds[0]) ~ $($ArchivedMonthIds[-1])") | Out-Null
    }
    $lines.Add("") | Out-Null
    $lines.Add("## 全局内容总结") | Out-Null
    Add-SectionLines -Lines $lines -Heading "### 每月摘要" -Items (Get-MonthSummaryLines -Entries $Entries) -EmptyLine "当前暂无可归档月份摘要。"

    return $lines.ToArray()
}

$repoRoot = Get-RepoRoot
$timestamp = $ReferenceTime.ToString("yyyy-MM-dd HH:mm:ss")
$currentMonthId = $ReferenceTime.ToString("yyyy-MM")
$currentDayId = $ReferenceTime.ToString("yyyy-MM-dd")
$codexRoot = Join-Path $repoRoot ".codex"
$memoryRoot = Join-Path $codexRoot "memory"
$globalOverviewPath = Join-Path $memoryRoot "全局记忆总览.md"
$currentMonthDir = Join-Path $memoryRoot $currentMonthId
$currentMonthOverviewPath = Join-Path $currentMonthDir "记忆总览.md"
$currentDailyPath = Join-Path $currentMonthDir "$currentDayId-每日记忆.md"
$actions = New-Object System.Collections.Generic.List[string]

Ensure-Directory -Path $codexRoot -Actions $actions
Ensure-Directory -Path $memoryRoot -Actions $actions
Ensure-Directory -Path $currentMonthDir -Actions $actions

Ensure-File -Path $currentDailyPath -TemplateLines (New-DailyTemplate -DayId $currentDayId -MonthId $currentMonthId -Timestamp $timestamp) -Actions $actions

$explicitMonthIds = @(Normalize-AllowedMonthIds -AllowedDirs $AllowedRelativeDirs)
$scanScopeLabel = Get-ScanScopeLabel -ExplicitMonthIds $explicitMonthIds -CurrentMonthId $currentMonthId

$existingMonthIds = @()
if (Test-Path $memoryRoot) {
    $existingMonthIds = @(
        Get-ChildItem -Path $memoryRoot -Directory |
            Where-Object { $_.Name -match "^\d{4}-\d{2}$" } |
            Select-Object -ExpandProperty Name
    )
}

$monthIdsToScan = if ($explicitMonthIds.Count -eq 0) {
    $existingMonthIds
}
else {
    @($existingMonthIds | Where-Object { $explicitMonthIds -contains $_ })
}

if ($monthIdsToScan -notcontains $currentMonthId) {
    $monthIdsToScan += $currentMonthId
}
$monthIdsToScan = @($monthIdsToScan | Sort-Object -Unique)

if ($explicitMonthIds.Count -gt 0) {
    $missingMonthIds = @($explicitMonthIds | Where-Object { $_ -ne $currentMonthId -and $monthIdsToScan -notcontains $_ })
    foreach ($missingMonthId in $missingMonthIds) {
        $actions.Add("SKIP missing whitelist dir $(Join-Path $memoryRoot $missingMonthId)") | Out-Null
    }
}

$archivedMonthIds = New-Object System.Collections.Generic.List[string]
$globalEntries = New-Object System.Collections.Generic.List[object]

foreach ($monthId in $monthIdsToScan) {
    $monthDir = Join-Path $memoryRoot $monthId
    if (-not (Test-Path $monthDir)) {
        continue
    }

    $monthOverviewPath = Join-Path $monthDir "记忆总览.md"
    $dailyFiles = @(
        Get-ChildItem -Path $monthDir -File -Filter "*-每日记忆.md" |
            Where-Object {
                $_.BaseName -match "^(\d{4}-\d{2}-\d{2})-每日记忆$"
            } |
            Sort-Object Name
    )

    $archivedDayIds = New-Object System.Collections.Generic.List[string]
    $monthEntries = New-Object System.Collections.Generic.List[object]

    foreach ($dailyFile in $dailyFiles) {
        $dayId = [regex]::Match($dailyFile.BaseName, "^(\d{4}-\d{2}-\d{2})-每日记忆$").Groups[1].Value
        if ([string]::IsNullOrWhiteSpace($dayId) -or $dayId -ge $currentDayId) {
            continue
        }

        $archivedDayIds.Add($dayId) | Out-Null
        foreach ($entry in @(Get-DailyEntries -DailyPath $dailyFile.FullName -MonthId $monthId -DayId $dayId)) {
            $monthEntries.Add($entry) | Out-Null
        }
    }

    $monthLines = New-MonthOverviewLines `
        -MonthId $monthId `
        -Timestamp $timestamp `
        -ScanScopeLabel $scanScopeLabel `
        -ArchivedDayIds ($archivedDayIds.ToArray()) `
        -Entries ($monthEntries.ToArray())
    Write-FileIfChanged -Path $monthOverviewPath -Lines $monthLines -Actions $actions

    if ($monthId -lt $currentMonthId -and $archivedDayIds.Count -gt 0) {
        $archivedMonthIds.Add($monthId) | Out-Null
        foreach ($entry in $monthEntries) {
            $globalEntries.Add($entry) | Out-Null
        }
    }
}

$globalLines = New-GlobalOverviewLines `
    -CurrentMonthId $currentMonthId `
    -Timestamp $timestamp `
    -ScanScopeLabel $scanScopeLabel `
    -ArchivedMonthIds ($archivedMonthIds.ToArray()) `
    -Entries ($globalEntries.ToArray())
Write-FileIfChanged -Path $globalOverviewPath -Lines $globalLines -Actions $actions

if ($actions.Count -eq 0) {
    Write-Host "PASS: .codex memory structure already healthy."
}
else {
    foreach ($action in $actions) {
        Write-Host $action
    }
}

Write-Host "ACTIVE MEMORY FILES:"
Write-Host "1. .codex/MEMORY.md"
Write-Host "2. .codex/memory/全局记忆总览.md"
Write-Host "3. .codex/memory/$currentMonthId/记忆总览.md"
Write-Host "4. .codex/memory/$currentMonthId/$currentDayId-每日记忆.md"
