param(
    [Parameter(Mandatory = $true)]
    [string]$HeadingSuffix,
    [string]$BodyText,
    [string]$BodyFilePath,
    [ValidateSet("是", "否")]
    [string]$PreferencesUpdated = "否",
    [ValidateSet("是", "否")]
    [string]$RequirementsUnderstood = "是",
    [string]$SnapshotPath,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$message = "RETIRED: dedicated session snapshot maintenance has been removed. Use scripts/append-codex-memory-turn.ps1 to append turn summaries to the current daily memory file."
if ($DryRun) {
    Write-Host $message
    exit 0
}

throw $message
