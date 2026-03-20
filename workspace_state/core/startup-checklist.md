# 工作区重启检查清单

## 目标
确保每次重启后快速恢复到一致的分析与交付状态。

## 启动步骤
1. 检查工作区技能加载目录 `./.codex/skills/` 是否存在且包含所需技能。
2. 读取 `AGENTS.md`，确认职责、输出规范与维护要求。
3. 执行 `scripts/maintain-codex-memory.ps1`，补齐 `.codex` 记忆层目录与日切/月切归档检查。
4. 读取 `.codex/MEMORY.md`，确认 `.codex` 记忆规范。
5. 读取 `.codex/memory/全局记忆总览.md`，恢复已归档月份上下文。
6. 读取 `.codex/memory/<当前年月>/记忆总览.md`，恢复当前月份已归档日期上下文。
7. 读取 `.codex/memory/<当前年月>/<当日日期>-每日记忆.md`，恢复当天增量上下文。
8. 读取 `workspace_state/目录导读.md`，恢复 `workspace_state/` 的目录入口与维护策略。
9. 读取 `user_profile/目录导读.md`，恢复 `user_profile/` 的目录入口与维护策略。
10. 读取 `workspace_state/core/workspace-state-overview.md`，确认当前机制版本。
11. 读取 `workspace_state/policies/preference-attribution-policy.md`，确认偏好防污染规则。
12. 读取 `workspace_state/observations/external-input-observations.md`，确认外部角色偏好与待归属事项。
13. 读取 `user_profile/core/thinking-patterns-overview.md`，恢复用户思维模式上下文。
14. 读取 `knowledge_base/analysis-methods-overview.md`，恢复可用分析方法与案例索引。
15. 读取 `skills/local-skills-overview.md`，恢复本地技能使用策略。
16. 检查 `workspace_state/collaboration/通用子角色协作卡.md` 是否存在并可读，确认当前通用子角色机制与职责口径。
17. 若存在 `./.codex/skills/subrole-invocation-orchestrator/SKILL.md`，检查其与 `通用子角色协作卡` 中的子角色清单与外化协议是否一致。
18. 检查 `user_profile/logs/thinking-patterns-change-log.md` 最近一条，确认最新偏好变化。
19. 若涉及执行提示词分发，检查 `docs/workflow/prompts/` 是否存在，并确认提示词保留窗口未超过 7 轮。
20. 检查历史归档索引是否可读：
    - `workspace_state/logs/session-history-index.md`
    - `user_profile/logs/change-log-history-index.md`
21. 检查长期偏好行数门禁是否通过：
    - 执行 `scripts/check-long-term-preference-cap.ps1`
    - 若超限，启动偏好评审并更新：
      1) `user_profile/core/thinking-patterns-short-term.md`
      2) `user_profile/governance/preference-review-log.md`
22. 执行 `scripts/maintain-state-health.ps1 -AutoArchive`，按阈值触发动态归档。

## 执行前自检
1. 是否识别当前任务所属领域？
2. 是否已执行 `.codex` 记忆层巡检，并按“规范 -> 全局总览 -> 月总览 -> 当日记忆”顺序完成读取？
3. 是否选择了合适分析方法（或方法组合）？
4. 是否明确哪些内容是事实、哪些是推断/假设？
5. 是否计划在本轮结束后更新状态文件、变更日志与当日 `.codex` 记忆？
6. 是否完成“能力扩展评估”（是否需要新增 skill 或 agent 角色）？
7. 是否完成“偏好归属检查”（owner vs trainer/外部角色），避免写错到 `user_profile/`？
8. 若无 owner 明确确认，本轮是否保持偏好“只暂存不提交”？
9. 是否读取并遵守 `AGENTS.md` 顶部 `MEMORY_UPDATE_SWITCH`（OFF 时不自动写档案）？
10. 是否遵守“分析师硬边界”（仅做需求文档，不做其他工作区工程改造）？
11. 若存在执行工作区，是否完成 `docs/workflow` 双工作区文档一致性校验（文件集与哈希）？
12. 本轮若新增执行提示词，是否已写入 `docs/workflow/prompts/` 并执行“保留最近 7 轮”清理？
13. 若 `thinking-patterns-change-log.md` 体量显著增长，是否执行 `scripts/maintain-state-health.ps1 -AutoArchive`？
14. 是否确认长期偏好主档（global/requirements/collaboration/overview）均未超过 200 行？
15. 是否保持 `workspace_state/` 与 `user_profile/` 顶层“仅 `目录导读.md` 一个文件”？
16. 若本轮涉及目录整理，是否先执行 `scripts/maintain-directory-health.ps1 -TargetDir <dir>` 做通用目录门禁检查？
17. 若本轮涉及已有系统的展示/交互需求，是否计划先输出与现有设计风格一致的原型预览，再进行跨工作区交付？
18. 若本轮计划使用通用子角色，是否确认其仍为抽象、通用角色，且与具体交付物解耦？
19. 若本轮任务跨多个工作流、需要目录级一致性检查，或用户对过程可见性有要求，是否计划使用 `subrole-invocation-orchestrator` 显式外化子角色职责、并行结构与检查结果？
20. 本轮回复是否计划外显“潜台词与底层需求分析”段落（除非用户明确要求省略）？

