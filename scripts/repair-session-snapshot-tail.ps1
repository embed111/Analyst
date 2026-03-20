param(
    [string]$SnapshotPath,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$message = "RETIRED: dedicated session snapshot tail repair is no longer needed. Current continuity is maintained through .codex daily memory files."
if ($DryRun) {
    Write-Host $message
    exit 0
}

throw $message
