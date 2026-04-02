# 工作区状态变更日志

## 2026-02-24
1. 新增 `workspace_state/` 目录与重启恢复机制文件：
   - `workspace_state/core/workspace-state-overview.md`
   - `workspace_state/core/startup-checklist.md`
   - `workspace_state/core/session-snapshot.md`
   - `workspace_state/logs/state-change-log.md`
2. 明确启动读取顺序和每轮维护规则。
3. 目标从“依赖对话上下文”升级为“依赖本地可追溯文档状态”。
4. 启动读取顺序新增 `skills/local-skills-overview.md`，纳入本地技能恢复。
5. 新增 3 个本地技能目录并通过校验：
   - `skills/method-selection-orchestrator/`
   - `skills/session-state-maintainer/`
   - `skills/proactive-practice-advisor/`
6. 方法库从 3 种扩展到 6 种，并补充新增方法对应案例。
7. 新增“工作区私有技能作用域”机制：
   - 新增工作区私有目录 `./.codex-home/skills/`。
   - 新增本地启动脚本 `start-codex-local.ps1` 与 `start-codex-local.cmd`。
   - `startup-checklist` 增加“优先使用本地启动脚本”步骤，避免回退到全局 `~/.codex/skills`。
8. 自定义技能从全局目录移回工作区私有目录，全局仅保留 `.system`。
9. 根据用户确认切换到工作区原生技能路径：
   - 将自定义技能迁移到 `./.codex/skill/`。
   - 删除 `start-codex-local.ps1` 与 `start-codex-local.cmd`。
   - 不再使用 `./.codex-home/skills/` 作为默认加载路径。
10. 本轮完成路径基线纠偏并补齐缺失索引：
   - `workspace_state/core/startup-checklist.md` 技能路径修正为 `./.codex/skills/`。
   - 新增 `skills/local-skills-overview.md`，记录本地技能目录与触发策略。

## 2026-02-25
1. 新增“能力扩展评估”机制，要求每轮分析默认判断是否需要新增 skill 或 agent 角色。
2. `AGENTS.md` 标准工作流新增步骤：
   - 在文档交付前完成“新增 skill/agent 角色”的触发判断、成本收益与采用结论记录。
3. `AGENTS.md` 质量检查清单新增自检项：
   - 必须明确“采用/暂不采用 + 理由”。
4. `workspace_state/core/startup-checklist.md` 执行前自检新增：
   - 是否完成能力扩展评估（skill/agent）。
5. `skills/local-skills-overview.md` 新增：
   - 能力扩展评估默认启用规则。
   - 新增 skill 与新增 agent 角色的触发信号与输出格式。
6. 新增“偏好归属隔离”机制，防止训练师/外部角色偏好误写入用户档案：
   - `AGENTS.md` 新增 owner 与 external 的记录边界规则。
   - `workspace_state/core/startup-checklist.md` 新增“偏好归属检查”自检项。
   - 新增 `workspace_state/observations/external-input-observations.md` 作为外部偏好落盘文件。
   - 重启读取顺序新增外部输入观察文件（`AGENTS.md` 与 `workspace-state-overview.md` 同步）。
7. 新增 `workspace_state/policies/preference-attribution-policy.md`：
   - 明确 fail-closed、来源标签、写入矩阵、写入前检查与污染回滚流程。
   - 启动读取顺序与检查清单同步纳入该策略文件。
8. 偏好治理升级为“二阶段提交”：
   - 未经 owner 明确确认，偏好仅允许暂存，不允许写入 `user_profile/`。
   - `AGENTS.md` 与 `startup-checklist.md` 已同步新增对应约束。
9. 新增 `AGENTS.md` 顶部运行开关 `MEMORY_UPDATE_SWITCH`：
   - `ON`: 允许自动更新状态/偏好档案。
   - `OFF`: 禁止自动更新（仅在用户明确指令时更新）。
   - `startup-checklist` 与 `preference-attribution-policy` 已同步接入该开关约束。
10. 新增“跨工作区需求文档一致性校验”流程：
   - `startup-checklist` 执行前自检新增双工作区 `docs/workflow` 文件集与哈希一致性检查。
   - 目标是避免分析工作区与执行工作区需求版本分叉。

## 2026-02-26
1. 新增本地技能 `snapshot-archive-governor`：
   - 路径：`./.codex/skills/snapshot-archive-governor/SKILL.md`
   - 能力：基于工作量阈值对 `workspace_state/core/session-snapshot.md` 进行归档压缩，并维护历史索引引用。
2. 更新技能目录索引：
   - `skills/local-skills-overview.md` 新增该技能与适用场景说明。
3. 更新顶层约束文件：
   - `AGENTS.md` 的“工作区本地技能”新增该技能，纳入默认可用能力范围。
4. 变更原因：
   - `session-snapshot.md` 体量持续增长，需引入可复用的归档治理流程，降低启动读取成本与维护噪音。

## 2026-03-02
1. 新增提示词专用目录治理：
   - 新增 `docs/workflow/prompts/`，用于集中存放 `执行提示词-*.md`。
   - 将 `docs/workflow/` 根目录下历史执行提示词迁移至该目录。
2. 新增滚动保留机制：
   - 新增脚本 `scripts/trim-workflow-prompts.ps1`。
   - 默认规则：每次新增后仅保留最近 7 轮提示词。
3. 执行工作区同步策略更新：
   - `../workflow/docs/workflow/prompts/` 同步执行提示词目录结构与文件。
4. 变更原因：
   - 降低目录噪音，提升提示词资产检索效率与跨工作区分发稳定性。

## 2026-03-03
1. 新增工作区档案归档脚本：
   - `scripts/archive-analyst-state.ps1`
   - 能力：对 `workspace_state/core/session-snapshot.md` 与 `user_profile/logs/thinking-patterns-change-log.md` 执行“先备份、再归档、后索引”的无损压缩。
2. 新增归档目录与索引文件：
   - `workspace_state/logs/session-history/`
   - `workspace_state/logs/session-history-index.md`
   - `user_profile/logs/change-log-history/`
   - `user_profile/logs/change-log-history-index.md`
3. 启动检查清单更新：
   - 增加归档索引可读性检查与“体量增长后执行归档脚本”的自检项。
4. 首次归档执行结果：
   - `session-snapshot.md`：1492 行 -> 241 行（历史 80 块归档）。
   - `thinking-patterns-change-log.md`：1089 行 -> 193 行（历史 71 块归档）。
5. 变更原因：
   - 在不丢失历史事实的前提下，降低启动读取成本与维护噪音。
6. 新增长期偏好精简门禁：
   - 新增 `scripts/check-long-term-preference-cap.ps1`（默认上限 200 行）。
   - 新增 `user_profile/core/thinking-patterns-short-term.md` 与 `user_profile/governance/preference-review-log.md`。
   - 当长期偏好超限时，启动评审并将非核心条目降级到短期偏好池。

## 2026-03-06
1. 完成状态目录结构重排：
   - `workspace_state/` 顶层仅保留 `目录导读.md`；
   - 状态文件下沉到 `core/`、`policies/`、`observations/`、`logs/`。
2. 完成偏好目录结构重排：
   - `user_profile/` 顶层仅保留 `目录导读.md`；
   - 偏好文件下沉到 `core/`、`governance/`、`logs/`。
3. 新增动态维护脚本：
   - `scripts/maintain-state-health.ps1`
   - 能力：按行数/体积/归档间隔阈值巡检，并可联动执行归档。
4. 归档脚本路径修正：
   - `scripts/archive-analyst-state.ps1` 的归档输出目录调整为：
     1) `workspace_state/logs/session-history/`
     2) `user_profile/logs/change-log-history/`
5. 机制文件同步更新：
   - `AGENTS.md`
   - `workspace_state/core/startup-checklist.md`
   - `workspace_state/core/workspace-state-overview.md`
   - `workspace_state/目录导读.md`
   - `user_profile/目录导读.md`
   - 相关本地技能 `SKILL.md`
6. 动态归档执行结果：
   - `workspace_state/core/session-snapshot.md`：1081 -> 447 行。
   - `user_profile/logs/thinking-patterns-change-log.md`：650 -> 180 行。
7. 新增通用目录治理技能：
   - `./.codex/skills/directory-maintenance-governor/SKILL.md`
   - 能力：将“顶层单导读 + 模块化落位 + 阈值归档”推广到任意目录整理场景。
8. 新增通用目录巡检脚本：
   - `scripts/maintain-directory-health.ps1`
   - 能力：对任意目录执行单导读门禁检查、阈值巡检，并按指定文件执行归档。
9. 技能与规则接入更新：
   - `AGENTS.md` 本地技能清单新增 `directory-maintenance-governor`。
   - `skills/local-skills-overview.md` 新增该技能说明。
   - `workspace_state/core/startup-checklist.md` 新增“目录整理前通用门禁检查”自检项。

## 2026-03-10
1. 展示/交互需求协作规则升级：
   - `AGENTS.md` 标准工作流新增“原型预览”步骤。
   - 明确：对已有系统的展示/交互类需求，需求确认后需先提供与现有设计风格一致的原型，再进行跨工作区交付。
2. 质量门禁同步更新：
   - `AGENTS.md` 质量检查清单新增“原型已确认”自检项。
   - `workspace_state/core/startup-checklist.md` 执行前自检新增“展示类需求先原型预览”检查项。
3. 变更原因：
   - 用户明确要求“需求确认后先确认原型图”，且原型必须保持现有产品设计风格。

## 2026-03-11
1. 通用子角色维护机制入规：
   - `AGENTS.md` 新增“通用子角色维护约定”。
   - 明确：子角色应保持抽象、通用，不得绑定具体交付物。
   - 权威清单路径固定为 `workspace_state/collaboration/通用子角色协作卡.md`。
2. 重启与执行自检同步更新：
   - `workspace_state/core/startup-checklist.md` 启动步骤新增对子角色协作卡的可读性检查。
   - `workspace_state/core/startup-checklist.md` 执行前自检新增“通用子角色保持抽象解耦”的检查项。
3. 变更原因：
   - 用户确认应在顶层机制文件中记录通用子角色的维护约定，以避免重启后丢失协作机制，但不希望将完整角色定义塞入 `AGENTS.md`。
4. 新增子角色显式调用技能：
   - 新增 `./.codex/skills/subrole-invocation-orchestrator/SKILL.md`。
   - 新增 `./.codex/skills/subrole-invocation-orchestrator/agents/openai.yaml`。
5. 协作机制同步更新：
   - `workspace_state/collaboration/通用子角色协作卡.md` 新增“显式调用协议”，固定子角色可见化输出顺序。
   - `skills/local-skills-overview.md` 新增该技能索引与触发建议。
   - `workspace_state/core/startup-checklist.md` 新增对子角色显式调用技能一致性与触发条件的检查项。
   - `AGENTS.md` 的本地技能清单、默认策略与子角色维护约定同步接入该技能。
6. 变更原因：
   - 用户明确要求不仅维护通用子角色，还要让其参与过程可见化、可复用，并更倾向用技能而不是每次临时说明。

## 2026-03-13
1. 新增 `session-snapshot` 尾部安全维护脚本：
   - `scripts/append-session-snapshot-turn.ps1`
   - 能力：将新的会话块以唯一尾部追加方式写入 `workspace_state/core/session-snapshot.md`，并自动更新 `最后更新` 与末尾检查语句。
2. 新增 `session-snapshot` 尾部顺序修复脚本：
   - `scripts/repair-session-snapshot-tail.ps1`
   - 能力：识别带 `session-turn-id` 标记的新会话块，并在误插中段时自动重排到文件尾部。
3. 动态维护脚本联动更新：
   - `scripts/maintain-state-health.ps1` 在巡检前增加对 `session-snapshot` 尾部顺序修复的调用。
4. 技能说明同步更新：
   - `./.codex/skills/session-state-maintainer/SKILL.md` 明确会话快照新增块优先通过追加脚本写入，而不是依赖重复文本锚点补丁。
5. 变更原因：
   - `session-snapshot.md` 存在大量重复 `快照检查` 与重复日期标题；若继续依赖上下文匹配插入，新块容易被写入文件中段而不是文件尾部。
6. 动态归档触发规则补强：
   - `scripts/maintain-state-health.ps1` 新增按更新块数量触发归档的规则：
     1. `workspace_state/core/session-snapshot.md` 更新块数 >= 35；
     2. `user_profile/logs/thinking-patterns-change-log.md` 日期块数 >= 25。
7. 变更原因补充：
   - 仅依赖行数/体积阈值会导致“块数很多但单块较短”的状态文件持续膨胀，无法及时回收。
8. 归档热恢复优化：
   - `scripts/archive-analyst-state.ps1` 默认保留块数下调为：
     1. `session-snapshot` 保留 12 块；
     2. `thinking-patterns-change-log` 保留 12 个日期块。
   - 顶层归档引用新增“最近归档摘要”，用于减少重启时对历史归档正文的依赖。
9. 变更原因补充：
   - 仅做历史搬运但顶层仍保留过多块，会导致“归档已发生，但恢复仍然慢”；需要同时压缩保留量并补摘要。

## 2026-03-15
1. 将“潜台词与底层需求分析”从长期偏好升级为执行硬约束：
   - `AGENTS.md` 的“对话与引导要求”新增规则：
     1) 每轮回复默认固定包含“潜台词与底层需求分析”段落；
     2) 仅当用户明确要求省略时，才允许不展示。
   - `AGENTS.md` 的质量检查清单同步新增对应自检项。
2. 启动执行自检同步更新：
   - `workspace_state/core/startup-checklist.md` 执行前自检新增“本轮是否计划外显潜台词分析段落”检查项。
3. 长期偏好表述同步收口：
   - `user_profile/core/thinking-patterns-overview.md` 将原“固定包含”收口为“默认固定外显，除非用户明确要求省略”。
4. 变更原因：
   - 用户明确要求这项能力不能继续弱化，需要从“偏好档案”提升为“启动即生效的硬规则”。

## 2026-03-19
1. 新增 `.codex` 分层记忆结构：
   - `.codex/MEMORY.md`
   - `.codex/memory/全局记忆总览.md`
   - `.codex/memory/YYYY-MM/记忆总览.md`
   - `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`
2. 新增 `.codex` 记忆维护脚本：
   - `scripts/maintain-codex-memory.ps1`
   - `scripts/append-codex-memory-turn.ps1`
3. 启动/收尾流程同步更新：
   - `AGENTS.md`
   - `workspace_state/core/startup-checklist.md`
   - `workspace_state/core/workspace-state-overview.md`
   - `./.codex/skills/session-state-maintainer/SKILL.md`
   - `./.codex/skills/session-state-maintainer/references/state-file-contracts.md`
4. 变更原因：
   - 用户明确要求 `.codex` 记忆改为“规范文件 + 全局总览 + 月总览 + 当日记忆”四层结构，并在每次工作前读取、每轮工作后追加总结，同时自动执行日切/月切归档检查。
5. 工作快照主路径迁移：
   - 活跃工作快照从 `workspace_state/core/session-snapshot.md` 迁移到 `.codex/memory/工作快照.md`。
   - 后续主维护路径收口到 `.codex/memory/`，旧 `session-snapshot.md` 冻结为历史参考，不再继续写入。
6. 补齐迁移后的脚本验证与误报修复：
   - `scripts/maintain-codex-memory.ps1` 修复工作快照模板中的 PowerShell 解析错误，恢复启动记忆自检链路。
   - `scripts/maintain-state-health.ps1` 移除“未建归档索引即触发归档”的误报逻辑，避免新工作快照在尚无历史归档时被反复判定为需要归档。
   - `scripts/append-session-snapshot-turn.ps1` 已验证默认追加目标为 `.codex/memory/工作快照.md`。
7. 变更原因补充：
   - 用户明确要求工作快照迁移后只维护记忆目录，因此需要同步确保启动恢复、回合写入与巡检归档三条链路都以 `.codex/memory/` 为唯一主入口。
8. 旧工作快照历史转化为记忆层：
   - 新增 `scripts/import-legacy-session-snapshot-to-codex-memory.ps1`，将 `workspace_state/core/session-snapshot.md` 与 `workspace_state/logs/session-history/*.md` 转换为 `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`。
   - 已导入 `2026-02-24` 至 `2026-03-18` 共 22 个历史每日记忆文件、337 条历史回合。
   - 已通过 `scripts/maintain-codex-memory.ps1` 回填 `.codex/memory/2026-02/记忆总览.md`、`.codex/memory/2026-03/记忆总览.md` 与 `.codex/memory/全局记忆总览.md`。
9. 维护脚本补强：
   - `scripts/maintain-codex-memory.ps1` 修复了历史导入后月总览缺失时的 DryRun/归档空文件判空问题，确保历史回填与日切/月切预演都可执行。
10. 进一步收口 `.codex` 记忆目录：
   - 移除 `.codex/memory/工作快照.md` 与 `.codex/memory/旧工作快照导入记录.md`。
   - 启动恢复、回合写回与巡检脚本收口为四层记忆：`MEMORY.md -> 全局总览 -> 月总览 -> 每日记忆`。
   - `scripts/maintain-codex-memory.ps1` 与 `scripts/import-legacy-session-snapshot-to-codex-memory.ps1` 已改为不再生成上述两个文件。
11. 退役遗留快照脚本入口：
   - `scripts/append-session-snapshot-turn.ps1` 与 `scripts/repair-session-snapshot-tail.ps1` 改为显式退役提示，不再允许写入或修复专用工作快照文件。
   - `scripts/archive-analyst-state.ps1` 改为仅归档 `thinking-patterns-change-log.md`，不再包含专用工作快照归档分支。
12. 变更原因补充：
   - 用户明确表示不需要额外的工作快照文件与导入记录文件，因此需要同时清除仍可能重新指向旧路径的遗留脚本入口，避免后续误生成。
13. `.codex` 总览生成逻辑收口：
   - `scripts/maintain-codex-memory.ps1` 新增 `-AllowedRelativeDirs` 白名单目录参数，默认扫描 `.codex/memory/` 下全部 `YYYY-MM` 月目录。
   - 月总览改为“每天一条摘要”，全局总览改为“每月一条摘要”，不再展开到每轮流水。
   - 当前总览文件已按新规则重建：`.codex/memory/2026-02/记忆总览.md`、`.codex/memory/2026-03/记忆总览.md`、`.codex/memory/全局记忆总览.md`。
14. 变更原因补充：
   - 用户进一步要求总览文件直接服务恢复记忆，重点是“按天/按月可回溯的摘要 + 可控扫描范围”，而不是把每日记忆中的每轮流水重新逐条抄写一遍。
15. 全局总览继续收口：
   - `scripts/maintain-codex-memory.ps1` 的全局总览输出移除 `### 跨月稳定决策/约束` 与 `### 跨月待跟进`。
   - `.codex/memory/全局记忆总览.md` 现仅保留 `### 每月摘要` 作为全局恢复入口。
16. 变更原因补充：
   - 用户明确表示这两个跨月附加段落没有必要；全局总览继续压缩，只保留按月回溯所需的最小摘要。
17. `.codex` 回合落盘约束升级：
   - `AGENTS.md` 与 `.codex/MEMORY.md` 已补充硬约束：每轮对话都必须真实写入当日记忆；若当轮未成功追加到 `.codex/memory/YYYY-MM/YYYY-MM-DD-每日记忆.md`，则该轮不视为已完成收尾。
18. 变更原因补充：
   - 用户直接指出出现了“本轮回答已给出但记忆未落盘”的执行漏洞，因此需要把“每轮真实落盘”从默认流程提升为显式硬规则。

## 2026-03-27
1. 本地黑盒辅助脚本默认文案中文化：
   - 更新 `Analyst/.tmp/` 下的 `workflow_tester` 创建 / 探测 / 提缺陷 / 补充说明 / dispatch / resume 等辅助脚本。
   - 后续默认使用中文缺陷标题、中文缺陷正文、中文补充说明、中文探测提示词与中文操作人。
2. 变更原因：
   - 用户明确要求“提缺陷或者 agent 都使用中文”，因此将默认值固化到本地工具层，避免后续继续从英文模板提单。

## 2026-04-01
1. `.codex` 全局总览的每月摘要口径升级：
   - 更新 `scripts/maintain-codex-memory.ps1` 的月级摘要生成逻辑。
   - `全局记忆总览.md` 的 `### 每月摘要` 不再直接拼接月内前几条回合主题，而是改为输出：
     1) `本月主线`
     2) `重点模块`
     3) `主要产出`
2. 规则收口：
   - 月级摘要改为基于关键词聚合整月回合内容，避免早期零散主题误代表整月工作。
   - 收紧过宽关键词，避免 `工作区`、`路径` 这类高频通用词挤占模块摘要。
3. 变更原因：
   - 用户明确指出“每月摘要应该说这一个月干了什么内容”，现有摘要读起来不明所以，因此需要把月摘要从“流水拼接”改成“月度主线概括”。
4. `.codex` 月总览的每日摘要口径升级：
   - 继续更新 `scripts/maintain-codex-memory.ps1` 的日级摘要生成逻辑。
   - `YYYY-MM/记忆总览.md` 的 `### 每日摘要` 不再直接堆叠“主要事项/决策/待跟进”，而是改为输出：
     1) `当天主线`
     2) `涉及模块`
     3) `主要产出`
     4) `结果`
5. 规则收口：
   - 每日摘要默认优先服务“快速回看当天干了什么”，不再把日记忆中的过程性决策和待跟进整段搬进月总览。
   - 若关键词规则无法稳定命中，再回退到原始主题/结果提取作为兜底。
6. 变更原因：
   - 用户进一步明确指出 `记忆总览.md` 里的每日摘要也应该说清楚“每天干了什么”，因此需要把日摘要也从流水拼接改成日级概括。

