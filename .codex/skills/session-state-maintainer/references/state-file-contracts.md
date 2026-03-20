# State File Contracts

## Purpose
Define minimum required sections so continuity files stay consistent.

## `.codex/MEMORY.md`
Required:
1. `最后更新`
2. read order rules
3. daily write rules
4. day/month rollover archive rules

## `.codex/memory/全局记忆总览.md`
Required:
1. `最后更新`
2. current month marker
3. archived thematic summary section
4. should summarize one archived month per item rather than expand to daily detail

## `.codex/memory/YYYY-MM/记忆总览.md`
Required:
1. `最后更新`
2. month scope description
3. archived thematic summary section
4. should summarize one archived day per item rather than expand to turn-by-turn detail

## `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`
Required:
1. `最后更新`
2. month marker
3. status line
4. turn record section with timestamped entries
5. current-day continuity should be recoverable from the latest entries without relying on a separate snapshot file

## `workspace_state/core/startup-checklist.md`
Required:
1. `目标`
2. `启动步骤`
3. `执行前自检`

## `workspace_state/logs/state-change-log.md`
Required:
1. Date header
2. What changed
3. Why changed

## `user_profile/logs/thinking-patterns-change-log.md`
Required:
1. Date header
2. New observations
3. Changed confidence or behavior
4. Pending verification items

## Confidence Labels
- `high`: repeated across scenes and turns
- `medium`: repeated in one scene
- `low`: single signal or ambiguous

