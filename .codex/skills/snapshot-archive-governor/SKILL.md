---
name: snapshot-archive-governor
description: Retired. Dedicated snapshot-file maintenance is no longer used; current continuity is carried by daily memory plus month/global overviews.
---

# Snapshot Archive Governor

This workflow is retired because dedicated snapshot files have been removed from the active memory chain.

## Inputs
1. Confirm whether the workspace uses the standard four-layer `.codex` memory chain.
2. Read `AGENTS.md` and honor `MEMORY_UPDATE_SWITCH`.
3. Prefer `scripts/maintain-codex-memory.ps1` for `.codex` memory maintenance.
4. Prefer `scripts/maintain-state-health.ps1 -AutoArchive` only for `thinking-patterns-change-log` maintenance.

## Current Policy
1. Do not recreate retired snapshot or import-report files.
2. Let current-day continuity remain in `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`.
3. Let historical compaction happen through:
   - daily -> month overview
   - month overview -> global overview
4. Let `thinking-patterns-change-log` continue using dynamic archive scripts when thresholds are hit.

## Quality Gates
1. Do not recreate retired files.
2. Preserve chronological traceability through daily/month/global memory files.
3. Keep facts and assumptions separated.

## Examples
1. Example A (current continuity):
- Signal: 新会话恢复。
- Action: 读取 `MEMORY.md -> 全局总览 -> 月总览 -> 当日记忆`。
- Evidence: 不依赖单独工作快照文件。
2. Example B (historical import complete):
- Signal: 旧工作上下文已迁入 `.codex/memory/`。
- Action: 保持历史导入结果，不再创建额外副本文件。
- Evidence: `.codex/memory/` 中只保留总览与每日记忆。

