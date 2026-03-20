param(
    [Parameter(Mandatory = $true)]
    [string]$Topic,
    [Parameter(Mandatory = $true)]
    [string]$Summary,
    [string]$Decision,
    [string]$FollowUp,
    [datetime]$ReferenceTime = (Get-Date),
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

    Set-Content -Path $Path -Value $Lines -Encoding UTF8
}

$repoRoot = Get-RepoRoot
$maintainScript = Join-Path $repoRoot "scripts/maintain-codex-memory.ps1"
$currentMonthId = $ReferenceTime.ToString("yyyy-MM")
$currentDayId = $ReferenceTime.ToString("yyyy-MM-dd")
$timestamp = $ReferenceTime.ToString("yyyy-MM-dd HH:mm:ss")
$dailyPath = Join-Path $repoRoot ".codex/memory/$currentMonthId/$currentDayId-每日记忆.md"

if (-not (Test-Path $maintainScript)) {
    throw "Missing script: $maintainScript"
}

if ($DryRun) {
    & $maintainScript -ReferenceTime $ReferenceTime -DryRun | Out-Null
}
else {
    & $maintainScript -ReferenceTime $ReferenceTime | Out-Null
}

if (-not (Test-Path $dailyPath)) {
    throw "Missing daily memory file: $dailyPath"
}

$lines = @(Get-Content -Path $dailyPath)
for ($i = 0; $i -lt $lines.Count; $i++) {
    if ($lines[$i] -match "^- 最后更新:") {
        $lines[$i] = "- 最后更新: $timestamp"
        break
    }
}

$filtered = New-Object System.Collections.Generic.List[string]
foreach ($line in $lines) {
    if ($line -eq "- 当前暂无回合记录。") {
        continue
    }
    $filtered.Add([string]$line) | Out-Null
}

while ($filtered.Count -gt 0 -and [string]::IsNullOrWhiteSpace($filtered[$filtered.Count - 1])) {
    $filtered.RemoveAt($filtered.Count - 1)
}

if ($filtered.Count -gt 0) {
    $filtered.Add("") | Out-Null
}
$filtered.Add("### $timestamp") | Out-Null
$filtered.Add("- 主题: $Topic") | Out-Null
$filtered.Add("- 总结: $Summary") | Out-Null
if (-not [string]::IsNullOrWhiteSpace($Decision)) {
    $filtered.Add("- 决策/约束: $Decision") | Out-Null
}
if (-not [string]::IsNullOrWhiteSpace($FollowUp)) {
    $filtered.Add("- 待跟进: $FollowUp") | Out-Null
}

Set-FileContent -Path $dailyPath -Lines $filtered
Write-Host "APPENDED: $dailyPath"
