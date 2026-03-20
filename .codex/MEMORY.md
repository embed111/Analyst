# .codex 记忆规范

- 最后更新: 2026-03-19
- 作用: 规定 `.codex` 记忆层的读取顺序、写入方式、日切/月切归档规则。
- 路径约定: 统一使用 `.codex/memory/`；用户原话中的 `.codex/memeory/` 视为同义笔误，不单独保留重复目录。

## 1. 读取顺序
1. 每次开始工作前先执行 `scripts/maintain-codex-memory.ps1`，确保日切/月切归档已补齐。
2. 然后按以下顺序读取：
   - `.codex/MEMORY.md`
   - `.codex/memory/全局记忆总览.md`
   - `.codex/memory/YYYY-MM/记忆总览.md`
   - `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`

## 2. 四层职责
1. `.codex/MEMORY.md`：只存规范，不存当轮工作流水。
2. `.codex/memory/全局记忆总览.md`：只收录已完成归档的历史月份总结，不保留当前月份未归档内容；按“每月一条摘要”帮助回溯，不展开到每日流水。
3. `.codex/memory/YYYY-MM/记忆总览.md`：只收录已完成归档的历史日期总结，不保留当天未归档内容；按“每天一条摘要”帮助回溯，不展开到每轮流水。
4. `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`：记录当天每一轮工作的时间戳总结，是当天唯一持续追加的记忆入口，同时承担当天工作连续性的当前态摘要。

## 3. 回合写入规则
1. 每轮工作结束后，若 `MEMORY_UPDATE_SWITCH: ON`，使用 `scripts/append-codex-memory-turn.ps1` 追加一条带时间戳的回合总结到当日记忆。
2. 回合总结至少包含：
   - `主题`
   - `总结`
3. 可按需补充：
   - `决策/约束`
   - `待跟进`
4. 当日记忆只追加，不覆盖历史回合。
5. 每轮对话都必须真实追加到当日记忆；若当轮未成功写入，则该轮不视为已完成收尾。

## 4. 日切/月切归档规则
1. 日切时，`scripts/maintain-codex-memory.ps1` 必须检查“昨日每日记忆”是否已经归入对应月份的 `记忆总览.md`。
2. 月切时，上述脚本必须检查“上月记忆总览”是否已经归入 `全局记忆总览.md`。
3. 当前日期的内容不提前写入月总览；当前月份的内容不提前写入全局总览。
4. 若连续多天或多月未运行，脚本需要补齐所有遗漏归档，不允许只处理最近一天或最近一个月。
5. 月总览与全局总览由 `scripts/maintain-codex-memory.ps1` 重建式生成，默认对 `.codex/memory/` 下全部 `YYYY-MM` 月目录生效；如需限制扫描范围，可传入 `-AllowedRelativeDirs YYYY-MM[,YYYY-MM...]` 白名单目录。

## 5. 边界
1. `.codex` 记忆层负责 agent 工作连续性与历史记忆汇总，不替代 `user_profile/` 的偏好治理。
2. `workspace_state/` 继续记录流程、策略、索引与治理状态，但不再维护主工作快照。
3. `user_profile/` 继续记录用户偏好与变更日志。
4. `.codex/memory/` 中的临时记录若要升级为长期偏好，仍需遵守现有偏好归属与二阶段提交规则。
5. 不再单独维护当前快照副本或导入说明副本；迁移说明进入变更日志，当前态直接由当日记忆承载。

## 6. 当前默认文件名
1. 月目录：`.codex/memory/YYYY-MM/`
2. 月总览：`.codex/memory/YYYY-MM/记忆总览.md`
3. 日记忆：`.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`
