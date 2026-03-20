---
name: session-state-maintainer
description: Keep workspace continuity across restarts by restoring and updating key state files. Use when a session starts, ends, or when workflow/process files change and must remain restart-ready without relying on long chat context.
---

# Session State Maintainer

Use this skill to enforce a repeatable restore-update cycle so the next session starts from the same working state.

## Start-of-Session Restore
1. Read files in this order:
- `AGENTS.md`
- run `scripts/maintain-codex-memory.ps1`
- `.codex/MEMORY.md`
- `.codex/memory/全局记忆总览.md`
- `.codex/memory/YYYY-MM/记忆总览.md`
- `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`
- `workspace_state/目录导读.md`
- `user_profile/目录导读.md`
- `workspace_state/core/startup-checklist.md`
- `user_profile/core/thinking-patterns-overview.md`
- `knowledge_base/analysis-methods-overview.md`
2. Identify missing or stale files and mark them for repair before task execution.
3. Summarize restored state in 3 to 6 lines before doing substantive work.

## End-of-Turn Update
1. When `MEMORY_UPDATE_SWITCH: ON`, append this turn's timestamped summary to `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md` with `scripts/append-codex-memory-turn.ps1`.
2. Run `scripts/maintain-codex-memory.ps1` so day/month rollover checks are applied before the next turn.
3. Update `user_profile/logs/thinking-patterns-change-log.md`.
4. If stable preference changed, also update:
- `user_profile/core/thinking-patterns-overview.md`
- the relevant domain file under `user_profile/`
5. If process changed, update:
- `workspace_state/core/startup-checklist.md`
- `workspace_state/logs/state-change-log.md`
6. Run `scripts/maintain-state-health.ps1 -AutoArchive` to apply threshold-based archive maintenance.

## Quality Gates
1. Keep facts and assumptions separated.
2. Mark non-explicit conclusions as `inference/assumption` with confidence.
3. Ensure new files are linked from overview/index files.
4. Fail closed: if critical state file is missing, recreate a minimal valid file first.

## Examples
1. Example A (start restore):
- Situation: 新会话刚启动。
- Action: 先执行 `maintain-codex-memory`，再按顺序读取 `.codex` 分层记忆与 `startup-checklist -> overview`。
- Output: 3~6 行恢复摘要 + 本轮优先事项。
2. Example B (end update):
- Situation: 本轮新增了需求文档与提示词。
- Action: 先用 `append-codex-memory-turn` 记录当轮总结，再更新 `change-log`，最后执行状态维护脚本。
- Output: 下一轮可直接续接的当日记忆块。
3. Example C (process changed):
- Situation: 新增了归档脚本或门禁脚本。
- Action: 同步更新 `startup-checklist` 与 `state-change-log`。
- Output: 启动自检步骤可感知新机制。

## References
1. Read `references/state-file-contracts.md` for required fields per state file.

