# 用户思维模式变更日志

## 历史归档引用
1. 已归档 1 个历史块到 user_profile\logs\change-log-history\thinking-patterns-change-log-history-2026-03-21-to-2026-03-21.md。
2. 历史索引见 user_profile\logs\change-log-history-index.md。
3. 最近归档摘要：
   - 2026-03-21: 已归档 1 个日期块

## 2026-03-21
1101. New observations（用户明示）：
   - 用户本轮明确要求：在 `bug` 模块需求已收口后，需要先看到一版可直接评审的原型图，而不是只看需求文档或口头描述。
1102. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对已有系统的新模块扩展，用户当前仍偏好“先看与现有风格一致的成品原型，再决定是否跨工作区交付实现”的节奏；该偏好此前已在多个展示/交互主题中出现，本轮在 `workflow bug` 模块场景下再次得到验证，先记录流水日志，不重复升格长期偏好主档。
1103. New observations（用户明示）：
   - 用户本轮进一步要求：当前 `bug` 模块的顶层命名不应锁死在单一缺陷语义上，而应提前升级为一个可承载未来并列能力域的模块；其中 `需求` 侧当前只需要预留空态，不要提前做实。
1104. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对新模块的信息架构，用户当前更偏好“先把顶层命名与未来扩展位摆正，再按阶段填内容”，而不是先做一个窄命名模块，后续再大改导航与心智模型。该偏好当前主要在 `workflow` 新增模块场景下成立，先记录流水日志，待跨其他并列能力模块主题复现后再评估是否升级长期偏好主档。
1105. New observations（用户明示）：
   - 用户本轮继续明确：当顶层模块名称从单一能力改为更泛化的并列能力域后，原型中的标题、状态标签与需求文档标题也要同步改口，不接受“结构改了但文案还停留在旧模块语义”。
1106. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对界面与需求文档的收口质量，用户当前更偏好“结构命名、界面标题、状态文案、需求标题同步更新”的一致性处理，而不是只改一处主标题后留下大量旧术语。该偏好当前主要在 `workflow` 模块命名调整场景下成立，先记录流水日志，待跨其他模块重命名场景复现后再评估是否升级长期偏好主档。
1107. New observations（用户明示）：
   - 用户本轮继续追问目录层，明确要求这种命名收口不能停留在页面文案和文档标题，原型目录、文件名与索引路径也要一并同步修改。
1108. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对需求资产治理，用户当前更偏好“名称一致性贯穿到目录、文件名、索引引用”这一层，而不是保留旧路径作为历史命名残留。该偏好当前主要在 `workflow` 模块重命名场景下成立，先记录流水日志，待跨其他文档资产重命名场景复现后再评估是否升级长期偏好主档。
1109. New observations（用户明示）：
   - 用户本轮直接反馈：当前原型设计仍不够简约，也不够符合第一性原理，说明即使模块命名与路径已经收口，如果默认视图仍存在过多解释性信息和装饰性结构，也会被视为偏离目标。
1110. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对展示类原型，用户当前更偏好“默认主视图只保留必要对象和必要动作”的第一性原理减法，而不是通过更多标签、说明和分栏去补足理解。该偏好当前主要在 `需求与缺陷` 模块场景下成立，先记录流水日志，待跨其他工作台模块复现后再评估是否升级长期偏好主档。
1111. New observations（用户明示）：
   - 用户本轮继续明确：状态筛选不应再平铺成一排按钮，而应收口为单一下拉；同时需要提供搜索入口，用于快速定位记录。
1112. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对极简列表页中的筛选交互，用户当前更偏好“下拉收口状态 + 搜索补充定位”的组合，而不是把多个状态按钮继续暴露在默认界面中。该偏好当前主要在 `需求与缺陷` 模块场景下成立，先记录流水日志，待跨其他列表型模块复现后再评估是否升级长期偏好主档。

## 2026-03-22
1113. New observations（用户明示）：
   - 用户本轮明确要求：`需求与缺陷` 模块中的 `需求 / 缺陷` 必须在同一内容区内通过选项卡切换显示；缺陷详情需要显式考虑 `状态变更历史`、`首轮不成立可转有分歧`、`有分歧后继续补充证据与描述`，并要求后端预留可供自动化测试直接提交与操作缺陷的接口。
1114. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对治理类工作台，用户当前更偏好“默认界面继续做减法，但争议路径、状态追溯和自动化接入口要在首期一起定义”，而不是先只做一个静态提交页，后续再补闭环规则。该偏好当前主要在 `workflow` 缺陷治理场景下成立，先记录流水日志，待跨其他治理模块复现后再评估是否升级长期偏好主档。
1115. New observations（用户明示）：
   - 用户本轮继续明确：`已解决后的复评` 不应再跳去新的独立页面或独立弹层输入，而应和 `首轮不成立后的补充说明` 一样，直接在当前缺陷详情页内输入并提交。
1116. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对闭环类工作台中的争议处理链，用户当前更偏好“同页承接输入，再走真实任务”的结构，而不是把触发动作和输入动作拆到两套入口里。该偏好当前主要在 `workflow` 缺陷治理场景下成立，先记录流水日志，待跨其他复核/申诉型模块复现后再评估是否升级长期偏好主档。
1117. New observations（用户明示）：
   - 用户本轮进一步确认：当复评补充区已经固定显示后，不应再保留一个额外的 `触发复评` 按钮；用户只需要直接在固定输入区补充内容并提交复评。
1118. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对强互动工作台中的动作设计，用户当前更偏好“一个业务动作只保留一个真正生效的按钮”，不接受固定输入区已存在时再保留没有独立业务语义的前置按钮。该偏好当前主要在 `workflow` 缺陷治理场景下成立，先记录流水日志，待跨其他表单/复核模块复现后再评估是否升级长期偏好主档。
1119. New observations（用户明示）：
   - 用户本轮明确要求：当前需求收口完成后，不是只停留在 `Analyst` 本地，而是要先整理成可执行交付包，再同步交付到 `../workflow`。
1120. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对跨工作区协作，用户当前更偏好“先整理需求资产，再做目标工作区同步”，而不是把尚未收口的需求、原型和提示词直接推给执行工作区。该偏好此前已有多次验证，本轮在 `需求与缺陷` 主题下再次得到确认，先记录流水日志，不重复升格长期偏好主档。

## 2026-03-23
1121. Maintenance notes（非偏好变更）：
   - 本轮按启动恢复顺序完成 `.codex` 四层记忆链、`workspace_state/`、`user_profile/`、方法库与本地技能入口读取；其中当日记忆文件由 `scripts/maintain-codex-memory.ps1` 自动补建。
1122. Maintenance notes（治理动作）：
   - 检测到 `user_profile/core/thinking-patterns-domain-collaboration.md` 超限（209 行），已按评审机制将“分发提示词治理/原型说明细则”降级到 `user_profile/core/thinking-patterns-short-term.md`，复查后长期主档恢复到 199 行。
1123. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；仅完成状态恢复与偏好档案治理。
1124. Maintenance notes（框架评估）：
   - 本轮对当前记忆框架的恢复效果做了结构化评估：对“硬事实/流程状态/稳定协作偏好”的恢复能力较强，但对“最近一两轮的细腻语气、临场权衡、未落盘的隐性意图”恢复有限。
1125. Maintenance notes（评估结论）：
   - 当前框架大致可恢复 70%~85% 的“继续工作所需引导”；其中流程状态与稳定约束恢复度更高，临场语境与微观动机恢复度更低。
1126. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述判断属于框架评估结论，不直接升格为长期偏好。
1127. Maintenance notes（框架判断）：
   - 本轮进一步确认：结合 Git 后，当前恢复链对“显式事实、文件差异、阶段性决策依据”的补强会明显增强，足以覆盖大部分继续工作所需上下文。
1128. Maintenance notes（边界判断）：
   - Git 仍主要恢复“已落盘且有版本痕迹”的内容，不能完整替代对“未提交的临场焦点、隐性取舍、对话语气与短期阻塞原因”的轻量记忆记录。
1129. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述判断属于工作方法评估，不直接升格为长期偏好。
1130. Maintenance notes（需求收口）：
   - 本轮新增 `定时任务` 模块需求：与 `任务中心` 同级；支持 `每月 / 每周 / 每日 / 定时` 四类规则混合；同一计划同一分钟多规则命中时合并为一次触发；日历视角必须同时展示计划与实际执行结果。
1131. Maintenance notes（交付动作）：
   - 已在当前工作区新增需求详情 `docs/workflow/requirements/需求详情-定时任务模块与日历视图.md`，并新增 HTML 原型 `docs/workflow/prototypes/定时任务模块与日历视图/定时任务参考图.html`；同时同步更新了 `需求概述.md` 与受影响模块的顶层导航口径。
1132. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述内容属于当前产品需求与交付事实，不直接升格为长期偏好。
1133. Maintenance notes（原型调整）：
   - 用户本轮继续反馈：当前定时任务原型中的按钮偏大，且“计划可编辑”需要在界面中显式可见，而不是只写在需求能力里。
1134. Maintenance notes（交付动作）：
   - 已将定时任务原型中的按钮尺寸整体压缩一档，并在计划详情中新增 `编辑计划 / 停用计划 / 查看任务中心实例 / 删除计划` 可见入口；同时在需求详情中补强“右侧详情必须提供计划管理动作”和“计划编辑”验收标准。
1135. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述反馈暂按当前原型主题内的交互修正处理，不直接升格为长期偏好。
1136. Maintenance notes（原型调整）：
   - 用户本轮继续指出：按钮高度仍偏高，并要求在日历右侧详情中也能直接编辑计划，而不是必须切回列表视角。
1137. Maintenance notes（交付动作）：
   - 已将定时任务原型按钮高度继续压缩到更轻的默认态，并在日历右侧详情中新增 `编辑计划 / 查看任务中心实例` 入口；同时在需求详情中明确“日历右侧详情区必须直接提供编辑计划入口”，并补充对应验收口径。
1138. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述内容仍按当前原型主题内的局部交互修正处理，不直接升格为长期偏好。
1139. Maintenance notes（原型调整）：
   - 用户本轮进一步澄清：默认时区应明确为北京时间；“按钮太高”主要指右上角头部按钮，而不是任务详情区按钮，后者当前反而偏窄。
1140. Maintenance notes（交付动作）：
   - 已将原型的头部按钮样式独立拆出并单独压缩，仅缩小右上角 `新建定时任务` 按钮；同时恢复详情区按钮为更自然的默认宽度，并把默认时区文案与需求口径统一为 `北京时间（Asia/Shanghai）`。
1141. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述内容仍按当前原型主题内的精细样式修正处理，不直接升格为长期偏好。
1142. New observations（用户明示）：
   - 用户本轮继续明确：`新建定时任务` 不应占据模块页头，而应放在左侧 `定时任务列表` 右上角，并采用更轻的 `+` 矢量图按钮；同时当前默认界面不需要展示“同计划同分钟”说明和时区标签。
1143. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对工作台中的新增入口与解释性信息，用户当前更偏好“操作入口就近挂在所属列表头部 + 系统规则保留为行为与留痕，不占默认可见区”的收口方式，而不是把创建动作、规则提示和时间基准一起堆在页头。该判断当前主要在 `workflow` 定时任务模块场景下成立，先记录流水日志，待跨其他列表型模块复现后再评估是否升级长期偏好主档。
1144. New observations（用户明示）：
   - 用户本轮继续要求：当前定时任务原型的配色应进一步扁平化，减少渐变、阴影和悬浮感；同时“任务目标”不能停留在抽象描述，发起任务时必须让人一眼知道具体要做什么。
1145. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 对工作台原型中的执行型内容，用户当前更偏好“视觉层级做减法 + 发起内容做加法”的组合：界面配色与容器层级要更克制扁平，但任务语义必须从抽象目标升级为可执行的摘要、清单与完成标准。该判断当前主要在 `workflow` 定时任务模块场景下成立，先记录流水日志，待跨其他派单/计划型模块复现后再评估是否升级长期偏好主档。
1146. Maintenance notes（需求补充）：
   - 用户本轮进一步补充：日历视角不能停留在单月静态展示，必须支持切月，允许用户在当前模块内连续查看不同月份的计划与结果。
1147. Maintenance notes（交付动作）：
   - 已在定时任务原型中补入 `上一月 / 下一月` 切换按钮与月份联动渲染，并在需求详情中新增“切月能力”与 `AC-ST-13` 验收标准；当前切月同时联动月份标签、日期格和右侧详情上下文。
1148. New observations（用户明示）：
   - 用户本轮明确要求：后续回复中避免使用“不是……而是……”这类对比句式，并将其作为需要记住的表达偏好。
1149. Changed confidence or behavior（owner_confirmed）：
   - 该偏好由用户本人直接确认，可写入长期协作偏好：在后续回复中保持“结论先行”的同时，避免使用“不是……而是……”对比句式，优先采用更直接、平铺的表达方式。
1150. Maintenance notes（需求复核）：
   - 本轮复核 `../workflow` 的定时任务需求交付状态，确认定时任务核心需求口径当前无需继续补新能力点；主要阻塞点是执行工作区尚未同步新增文档，且相邻文档仍保留旧导航口径。
1151. Maintenance notes（交付动作）：
   - 已将 `需求概述.md`、`需求详情-定时任务模块与日历视图.md`、`需求详情-任务中心与依赖可视化编排.md`、`需求详情-需求与缺陷模块-缺陷闭环首期.md`、`定时任务参考图.html` 与新增执行提示词同步到 `../workflow`，并完成关键文件哈希一致性校验。
1152. Maintenance notes（治理动作）：
   - 已按提示词目录保留策略，在 `Analyst` 与 `../workflow` 两侧各清理 1 条最旧提示词；当前 `docs/workflow/prompts/` 均保留最近 7 轮。
1153. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；本轮内容属于“定时任务需求复核与跨工作区交付”的任务事实，不直接升格为长期偏好。

## 2026-03-24
1154. Maintenance notes（运行态核验）：
   - 本轮按启动恢复顺序完成 `.codex` 记忆链、`workspace_state/`、`user_profile/`、方法库与本地技能入口读取，并对 `http://127.0.0.1:8090` 执行了端口连通性与页面运行态核验。
1155. Maintenance notes（取证结果）：
   - 已确认 `8090` 端口可访问，首页返回 `200`，且通过无头 Edge 抓取到渲染后 DOM 与页面截图；当前可见 `PROD` 环境、版本 `20260323-181854`、左侧 `对话 / 工作记录与训练 / 训练中心 / 任务中心 / 需求与缺陷 / 设置` 入口，以及“trainer 已阻断、不可新建会话”的实际运行态。
1156. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮请求属于一次性运行效果核验，不直接升格为长期偏好。
1157. Maintenance notes（知识问答）：
   - 本轮围绕“项目从快速验证过渡到工程化”的追问，补充整理了“需求分析与用例设计如何工程化”的主流做法，重点聚焦需求分层、持续细化、可追溯、示例化与可执行验收。
1158. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮属于方法论追问，不直接升格为长期偏好。
1159. Maintenance notes（反馈纠偏）：
   - 用户本轮直接指出：前一轮回答未体现“需求分析师”应有的分析能力，问题不在资料多少，而在于没有把“需求工程化 / 用例工程化 / 分析师职责边界”讲清楚。
1160. Maintenance notes（处理动作）：
   - 已按“显性目标复述 + 能力缺口确认 + 需求工程化纠偏框架”重新组织回答，重点回到需求资产分层、用例场景化、追溯与门禁，不再泛化为通用软件工程综述。
1161. Maintenance notes（需求修正草案）：
   - 基于 `../workflow` 创建角色会话 `rcs-20260323-102238-f565cb` 的实际取证，已新增 `docs/workflow/requirements/需求详情-训练中心创建角色链路修正.md`，聚焦草稿污染、字段级独立编辑、差异对齐回路、状态语义拆分与附件轻量引用。
1162. Maintenance notes（总览更新）：
   - 已更新 `docs/workflow/overview/需求概述.md`，将“训练中心创建角色链路修正”纳入详细需求文档索引，并新增第 41 节记录本轮增量事实、收敛口径与当前边界。
1163. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述内容属于当前 `workflow` 创建角色链路的取证与需求修正交付，不直接升格为长期偏好。
1164. Maintenance notes（原型修补）：
   - 用户要求“先修一轮看看”，本轮未触碰 `../workflow` 实现，仅在 `docs/workflow/prototypes/创建角色工作流-预稿/创建角色工作流预稿.html` 中把右侧详情区修正为“待对齐 / 可开始未开始 / 当前无任务图”的真实草稿状态。
1165. Maintenance notes（原型语义收口）：
   - 已将可见右侧详情区从旧的“增长分析师 / 阶段 4 / 创建中”场景切换为 `workflow_tester` 草稿对齐场景，补入字段差异对齐、待确认协作方式、无 `task_id`、附件仅作轻量引用等表达，并保留旧区块为 hidden legacy 参考。
1166. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮属于当前原型的迭代验收与效果预览诉求，不直接升格为长期偏好。
1167. Maintenance notes（原型微调反馈）：
   - 用户进一步确认两点：画像区不需要“字段 01/02/03”这类编号感；右侧画像内容应保持单列阅读，避免继续压缩为多列摘要或并排 diff。
1168. Maintenance notes（交付动作）：
   - 已在 `docs/workflow/prototypes/创建角色工作流-预稿/创建角色工作流预稿.html` 中移除画像区编号标题，并将 `profile-summary` 与 `field-diff-grid` 调整为单列布局。
1169. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述内容当前仍属于这版原型的局部验收反馈，先记流水，不直接升格为长期偏好。
1170. Maintenance notes（跨工作区交付）：
   - 用户本轮明确要求“交付个 workflow”；已按需求分析师职责边界，仅同步需求文档与原型到 `../workflow/docs/workflow/`，未改动 `../workflow` 的实现代码、脚本、接口或页面逻辑。
1171. Maintenance notes（交付清单）：
   - 已同步以下文件到 `../workflow`：
     1. `docs/workflow/requirements/需求详情-训练中心创建角色链路修正.md`
     2. `docs/workflow/overview/需求概述.md`
     3. `docs/workflow/prototypes/创建角色工作流-预稿/创建角色工作流预稿.html`
1172. Maintenance notes（校验结果）：
   - 已对上述 3 个文件执行 SHA256 一致性校验，当前 `Analyst` 与 `../workflow` 两侧内容一致。
1173. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮属于一次性交付动作，不直接升格为长期偏好。
1174. Maintenance notes（执行提示词交付）：
   - 用户本轮进一步要求“给我一个提示词让 ../workflow 开工”；已新增提示词文件 `docs/workflow/prompts/执行提示词-训练中心创建角色链路修正开工-20260324.md`，并同步到 `../workflow/docs/workflow/prompts/`。
1175. Maintenance notes（目录治理）：
   - 为满足“执行提示词目录仅保留最近 7 轮”的既有规则，已在 `Analyst` 与 `../workflow` 两侧同步删除最旧的 `执行提示词-任务中心全量开工-20260315.md`。
1176. Maintenance notes（校验结果）：
   - 新增提示词文件已完成跨工作区 SHA256 一致性校验，可直接作为对 `../workflow` 的开工入口。
1177. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；该回合属于提示词资产交付与目录治理动作，不直接升格为长期偏好。

## 2026-03-25
1178. Maintenance notes（真实体验取证）：
   - 用户再次明确要求以真实运行系统共同体验 `../workflow` 功能，而不是停留在抽象讨论；本轮已接入 `http://127.0.0.1:8090`，并以低风险用户操作验证 `训练中心 -> 创建角色` 的实际运行效果。
1179. Maintenance notes（关键发现）：
   - 已确认线上创建角色链路存在三类问题：
     1. 历史脏草稿与超时记录仍被标记为“草稿信息已齐，可直接开始创建”；
     2. 角色画像字段抽取会把用户原话误写进结构化字段，旧草稿中甚至把“不能单独先改个名称吗”写进“能力边界”；
     3. 新草稿即使使用短而结构化的输入，画像仍出现字段串联与重复，但系统依旧放行“开始创建”。
1180. Maintenance notes（体验边界）：
   - 本轮仅执行了低风险体验动作：新建一次性草稿、发送一条结构化测试消息、切换详情标签并截图；未点击“开始创建”“确认完成”或删除草稿。
1181. Maintenance notes（偏好结论）：
   - 用户再次验证其稳定偏好：希望通过真实产品体验共同诊断设计问题，优先看运行效果与证据，再谈抽象方案；该倾向与既有“真实体验优先/先看效果再判断”一致，本轮仅记流水，不新增长期偏好条目。
1182. Maintenance notes（缺陷闭环实测）：
   - 用户明确要求直接通过 `workflow` 的“需求与缺陷”模块，把已发现的创建角色问题录入 bug 列表，以便后续走“bug -> 任务中心 -> 修复”的闭环。
1183. Maintenance notes（提交结果）：
   - 已在 `需求与缺陷 -> 缺陷` 中录入 6 条与“训练中心创建角色”相关的问题，其中 2 条直接进入正式缺陷链路（`DTS-00001`、`DTS-00002`），1 条在提交复核后转为“有分歧”并生成 `DTS-00003`，其余 3 条仍被当前 `fallback_rule` 判定为“当前不构成 workflow 缺陷”。
1184. Maintenance notes（链路发现）：
   - 在 `DTS-00003` 的复核动作中，系统自动生成了任务中心任务引用 `asg-20260325-132002-d119da`；这表明当前系统已具备一部分“缺陷记录 -> 任务中心”的桥接能力，但前置缺陷判定规则仍会漏判明显问题。
1185. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户当前诉求仍属于一次性产品闭环验证与缺陷录入，不直接升格为长期偏好。
1186. Maintenance notes（任务中心核验）：
   - 用户指出“任务中心里看不到我说的任务”；本轮已进一步核验 UI 与文件层，确认 `asg-20260325-132002-d119da` 在磁盘中真实存在，但任务中心页面在 2026-03-25 13:20 之后多次刷新仍只显示 2026-03-20 的 2 条旧任务。
1187. Maintenance notes（新增缺陷）：
   - 已将上述链路一致性问题录入为新缺陷 `[任务中心][P0] 缺陷复核已创建任务但任务中心列表不显示`，并直接进入正式缺陷链路 `DTS-00004`。
1188. Maintenance notes（需求增量）：
   - 用户本轮明确要求在 `需求与缺陷 -> 缺陷` 中补入两类规则：
     1. 缺陷列表默认按任务优先级高到低排序，同优先级按 bug 提交时间先后排序；
     2. 缺陷界面新增“按顺序创建任务”总开关，开启后若当前没有正在解决的 bug，则自动向任务中心为队首缺陷建单，上一条 bug 解决后再继续下一条。
1189. Maintenance notes（文档交付）：
   - 已更新 `docs/workflow/requirements/需求详情-需求与缺陷模块-缺陷闭环首期.md` 与 `docs/workflow/overview/需求概述.md`，补入 `task_priority / reported_at`、缺陷默认排序、主动处理位、自动顺序建单门禁与对应验收标准。
1190. Maintenance notes（原型交付）：
   - 已更新 `docs/workflow/prototypes/需求与缺陷模块-缺陷闭环首期/需求与缺陷模块参考图.html`，新增页头总开关、当前主动处理/下一条待建单摘要、列表 `P0/P1/P2` 优先级与上报时间展示，并让列表按优先级/时间稳定排序。
1191. Maintenance notes（跨工作区同步）：
   - 已将上述 3 个文件同步到 `../workflow/docs/workflow/`，并完成 `Analyst` 与 `../workflow` 两侧 SHA256 一致性校验。
1192. Maintenance notes（截图限制）：
   - 本轮尝试通过 Playwright 重新导出更新后的主视图 PNG，但浏览器二进制下载在当前环境中连续超时失败；因此本轮以更新后的 HTML 原型作为主预览真相源，原 PNG 路径暂保留待后续重导出。
1193. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；上述内容属于当前 `workflow` 缺陷治理规则与原型迭代，不直接升格为长期偏好。
1194. Maintenance notes（流程顺序纠偏）：
   - 用户本轮明确强调：应先在当前 `Analyst` 工作区完成修改，再交付到隔壁工作区；这与既有“先本地单点修改，再分发”的治理口径一致。
1195. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；该表达属于对既有分发顺序规则的再次强调，先记流水，不单独升格为新偏好条目。
1196. Maintenance notes（执行提示词交付）：
   - 已在当前工作区新增 `docs/workflow/prompts/执行提示词-需求与缺陷模块排序与顺序建单开工-20260325.md`，用于推动 `../workflow` 实现“缺陷默认排序 + 按顺序创建任务总开关”。
1197. Maintenance notes（目录治理）：
   - 为保持 `docs/workflow/prompts/` 仅保留最近 7 轮，已在 `Analyst` 与 `../workflow` 两侧同步移除最旧的 `执行提示词-任务中心真实执行化开工-20260316.md`。
1198. Maintenance notes（校验结果）：
   - 新提示词文件已完成跨工作区 SHA256 一致性校验，当前 `Analyst` 与 `../workflow` 两侧内容一致，可直接转发执行。

## 2026-03-26
1199. Maintenance notes（8090 一致性复核）：
   - 按用户要求对 `../workflow` 的 8090 运行态做了只读核验，对照上一轮缺陷闭环需求检查“排序 + 顺序建单 + 任务中心桥接”是否一致。
1200. Maintenance notes（关键差异收口）：
   - 已将当前主差异收口为两类正式修正项：
     1. `task_priority` 必须以用户显式优先级为真相源，不能继续出现摘要写 `[P0]`、落盘与建单却为 `P1` 的分裂；
     2. 同一 `report_id + action_kind` 必须收口为单条有效处理链，不得再生成多张并存任务图。
1201. Maintenance notes（交付动作）：
   - 已更新 `docs/workflow/requirements/需求详情-需求与缺陷模块-缺陷闭环首期.md` 与 `docs/workflow/overview/需求概述.md`，补入 2026-03-26 的修正口径与验收标准。
   - 已新增 `docs/workflow/prompts/执行提示词-需求与缺陷模块优先级真相源与重复建单修正开工-20260326.md`，用于让 `../workflow` 按当前差异直接修改并回传验收证据。
1202. Maintenance notes（目录治理）：
   - 为保持 `docs/workflow/prompts/` 仅保留最近 7 轮，已在当前工作区删除最旧的 `执行提示词-workflow三环境部署与用户可控升级开工-20260318.md`，并同步清理 `../workflow` 对应旧提示词。
1203. Maintenance notes（校验结果）：
   - 已对 `需求概述.md`、`需求详情-需求与缺陷模块-缺陷闭环首期.md`、新提示词文件执行跨工作区 SHA256 一致性校验，`Analyst` 与 `../workflow` 两侧内容一致。
1204. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮诉求属于“在真实差异核验后直接生成可分发的修改验收指令”，与既有“先本地收口、再分发、再校验”的稳定口径一致，先记流水，不单独升格为新偏好条目。
1205. Maintenance notes（复核更新）：
   - 用户再次要求核对 `../workflow` 生产环境 `8090` 的缺陷功能与上一轮需求是否一致；本轮按 2026-03-26 16:22 +08:00 的接口返回再次做只读复核。
1206. Maintenance notes（最新结论）：
   - 当前结论更新为“部分一致，但仍未完全一致”：
     1. 缺陷记录接口中的 `task_priority` 与队列摘要已从此前的 `P1` 修正为 `P0`；
     2. 但对应 `任务中心` 节点 `priority_label` 仍为 `P1`，说明优先级真相源尚未贯穿到建单结果；
     3. 同一 `external_request_id=defect:process:dr-20260325-ca49dd19d9` 仍存在 3 张并存任务图，重复建图问题仍未修掉。
1207. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮属于对同一生产问题的二次复核与结果确认，先记流水，不单独升格为新偏好条目。
1208. Maintenance notes（第三次复核）：
   - 用户继续要求“再检查一下”；本轮按 2026-03-26 17:24 +08:00 的生产接口与任务中心总图再次做只读复核。
1209. Maintenance notes（最新状态变化）：
   - 当前生产态已进一步变化：
     1. 缺陷记录中的 `task_priority` 维持为 `P0`；
     2. `DTS-00003 / DTS-00004` 的缺陷链路已从旧独立任务图收口进 `任务中心全局主图 asg-20260326-122459-a50c6f`；
     3. 总图中的对应节点 `priority_label` 已修正为 `P0`；
     4. 历史独立图 `asg-20260325-132002-d119da / asg-20260325-155330-bc6838 / asg-20260325-155333-d270ba / asg-20260325-155336-3cac33` 已不再作为有效图保留，并在缺陷历史中记录了 repair 收口动作与 `deleted_legacy_ticket_ids`。
1210. Maintenance notes（当前结论）：
   - 按当前最新运行态判断，上一轮要求的两条关键验收项：
     1. `AC-BM-18` 显式优先级统一真相源；
     2. `AC-BM-19` 同一缺陷动作不得重复建图；
     已基本达成，当前整体可视为与上一轮最新需求对齐。
1211. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮属于对同一生产问题的连续复核，先记流水，不单独升格为新偏好条目。
1212. Maintenance notes（需求层级纠偏）：
   - 用户明确指出此前一级需求不是“每条缺陷各有一张任务图”，而是“所有缺陷共用一个总开关；上一条缺陷未解决前，不得给下一条缺陷生成任务；所有任务统一收口到全局唯一任务图”。
1213. Maintenance notes（分析结论修正）：
   - 已将验收主次调整为：
     1. 一级约束：`全局单开关 + 单主动处理位 + 开启后串行建单`；
     2. 二级约束：`全局唯一主图 + 同一缺陷动作幂等 + 优先级真相源一致`。
   - 因此，不能再仅凭“已收口到全局主图、旧独立图已失效”就直接判定完全符合原始需求。
1214. Maintenance notes（文档与同步）：
   - 已更新并同步以下文件到 `../workflow/docs/workflow/`，且完成 SHA256 一致性校验：
     1. `docs/workflow/requirements/需求详情-需求与缺陷模块-缺陷闭环首期.md`
     2. `docs/workflow/overview/需求概述.md`
     3. `docs/workflow/prompts/执行提示词-需求与缺陷模块优先级真相源与重复建单修正开工-20260326.md`
1215. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；“全局单开关 + 串行建单 + 全局唯一主图”属于当前缺陷模块的已确认业务需求，不单独升格为跨主题长期偏好。
1216. Maintenance notes（展示收敛）：
   - 用户指出 `缺陷` 视图页头“按顺序创建任务”区域占用空间偏大，并明确要求“更简约一些，配色扁平化”。
1217. Maintenance notes（本轮处理）：
   - 已在 `Analyst` 本地原型中将该区域收口为轻量摘要条：
     1. 保留总开关、当前主动处理、下一条待建单与串行规则摘要；
     2. 去掉大块统计卡感与渐变背景；
     3. 切换为更扁平的浅灰底 + 低饱和状态色。
1218. Maintenance notes（分发边界）：
   - 本轮先停留在本地原型预览与需求文档补充，尚未同步到 `../workflow`；待用户确认该视觉方向后再跨工作区分发。
1219. Maintenance notes（展示位置调整）：
   - 用户继续明确：顺序建单区域不要挤在缺陷列表上方，更适合放到当前缺陷详情下面；同时整体界面希望进一步紧凑。
1220. Maintenance notes（本轮处理）：
   - 已在 `Analyst` 本地原型中完成第二轮收口：
     1. 删除列表区上方的顺序建单条带；
     2. 将总开关、当前主动处理、下一条待建单与串行规则摘要移入右侧缺陷详情区；
     3. 左侧列表仅保留更关键的“当前处理中”提示，不再展示普遍性的“排队中”标签；
     4. 同步压缩列表宽度、卡片内边距、facts 区、section 间距与输入控件高度，使整体更紧凑。
1221. Maintenance notes（需求文档同步）：
   - 已将需求口径从“页头展示顺序建单”更新为“详情区展示顺序建单”，并补入“列表区不再常驻大块顺序建单条带”的验收要求；当前仍仅保留在 `Analyst` 本地，待用户确认后再同步到 `../workflow`。
1222. Maintenance notes（可见性纠偏）：
   - 用户反馈“没看到总开关”，说明此前将顺序建单下沉到详情区后，标题与按钮文案过轻，未形成明确的开关识别。
1223. Maintenance notes（本轮处理）：
   - 已在本地原型中把该模块提到详情区靠上位置，并显式改为：
     1. 标题：`顺序建单总开关`
     2. 按钮文案：`总开关: 自动 / 手动`
   - 目标是避免它继续被误读为普通状态摘要或普通标签。
1224. Maintenance notes（展示取舍更新）：
   - 用户进一步确认：总开关独立出来更好，不应继续和顺序建单摘要混在同一个模块里。
1225. Maintenance notes（本轮处理）：
   - 已在 `Analyst` 本地原型中将该区域拆成两个相邻独立块：
     1. `顺序建单总开关` 独立控制块；
     2. `顺序建单摘要` 信息块。
   - 同时将需求文档补成明确约束：总开关应独立于顺序建单摘要展示，不能再混成同一颗状态胶囊。
1226. Maintenance notes（位置确认）：
   - 用户进一步明确：总开关应直接放在 `缺陷记录` 标题栏，而不是继续放在详情正文里。
1227. Maintenance notes（本轮处理）：
   - 已在本地原型中将总开关移入左侧 `缺陷记录` 标题栏右侧，按钮文案保持 `总开关 已开启 / 已关闭`。
   - 右侧详情区只保留 `顺序建单摘要`，继续承载“当前主动处理 / 下一条待建单 / 串行规则说明”。
1228. Maintenance notes（需求同步）：
   - 已将需求文档与 AC-BM-20 同步改为：
     1. `缺陷记录` 标题栏放总开关；
     2. 当前缺陷详情区放顺序建单摘要；
     3. 列表内容区上方不再常驻大块顺序建单条带。

## 2026-03-27
1229. Maintenance notes（分发确认）：
   - 用户明确要求本轮直接交付给 `../workflow`，并强调“开启开关后就会不断开始解决 bug”必须作为真实实现效果，而不是停留在文案描述。
1230. Maintenance notes（文档与同步）：
   - 已更新并同步以下文件到 `../workflow/docs/workflow/`：
     1. `docs/workflow/requirements/需求详情-需求与缺陷模块-缺陷闭环首期.md`
     2. `docs/workflow/overview/需求概述.md`
     3. `docs/workflow/prototypes/需求与缺陷模块-缺陷闭环首期/需求与缺陷模块参考图.html`
     4. `docs/workflow/prompts/执行提示词-需求与缺陷模块标题栏总开关与连续解决缺陷开工-20260327.md`
1231. Maintenance notes（校验与治理）：
   - 已对上述 4 个文件完成跨工作区 SHA256 一致性校验，`Analyst` 与 `../workflow` 两侧内容一致。
   - 已补做 `../workflow/docs/workflow/prompts/` 活跃窗口治理：旧的 `执行提示词-测试数据环境策略与开关下线开工-20260318.md` 已移至 `../workflow/docs/workflow/governance/prompt-history/`，当前活跃目录仅保留最近 7 轮提示词。
1232. Maintenance notes（需求收口）：
   - 当前有效口径固定为：
     1. `缺陷记录` 标题栏右侧放全局总开关；
     2. 右侧详情区仅保留 `顺序建单摘要`；
     3. 只要总开关保持开启，系统就必须在上一条进入 `已解决` 或 `已关闭` 后持续自动推进下一条缺陷，直到队列为空或用户关闭总开关。
1233. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；“先同步再给可直接转发提示词”与“强调真实连续行为而非一次性触发”继续验证既有稳定协作偏好，先记流水，不单独升格为新偏好条目。
1234. Maintenance notes（职责边界处理）：
   - 用户希望我直接到 `workflow` 生产环境里使用“创建角色”功能，创建 `workflow_tester` 来承担后续测试工作。
   - 该动作超出当前“需求分析师”硬边界，因此本轮未直接执行生产环境操作，也未创建角色实体。
1235. Maintenance notes（交接资产）：
   - 已新增并同步执行提示词：
     1. `docs/workflow/prompts/执行提示词-创建workflow_tester角色并验证创建链路-20260327.md`
   - 提示词已明确要求执行工作区：
     1. 通过真实 `训练中心 -> 创建角色` 链路创建 `workflow_tester`；
     2. 验证 `role_spec` 无字段污染；
     3. 验证“可开始”与“已真实开始创建”不再混写；
     4. 若成功，继续证明该角色可承担最小测试任务；
     5. 若失败，完整回传页面、接口与 trace 证据。
1236. Maintenance notes（提示词治理）：
   - 为保持 `docs/workflow/prompts/` 活跃窗口仅保留最近 7 轮，已将两侧工作区中的 `执行提示词-创建角色工作流与任务绑定开工-20260321.md` 移入 `docs/workflow/governance/prompt-history/`。
1237. Maintenance notes（校验结果）：
   - 新提示词文件已完成跨工作区 SHA256 一致性校验，`Analyst` 与 `../workflow` 两侧内容一致。
1238. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户当前诉求属于“希望直接推进真实执行”，但本轮仍需受分析师职责边界约束，先记流水，不单独升格为新偏好条目。
1239. Maintenance notes（验收独立性要求）：
   - 用户明确指出：若由 `workflow` 自己执行并验收“创建角色”功能，存在自验作弊嫌疑；本轮真正目标是用独立执行者去真实跑一遍创建角色链路，以验证该功能是否可用。
1240. Maintenance notes（当前阻塞）：
   - 当前 `Analyst` 会话因职责边界无法直接在 `workflow` 生产环境中执行“创建角色”这类会改动真实数据的操作；该阻塞属于“角色边界与验收独立性同时成立”，不是需求未收敛。
1241. Maintenance notes（后续建议）：
   - 更合理的分工是：由非 `workflow` 自身的独立执行会话进入 `../workflow` 做黑盒验收；`Analyst` 继续负责验收口径、失败归因和缺陷收口，避免“实现者自己给自己盖章”。
1242. Maintenance notes（创建角色黑盒验收已执行）：
   - 用户进一步明确：本轮不是要求改 `../workflow` 工作区代码，而是要求直接在 `http://127.0.0.1:8090` 上走真实功能链路，验证“创建角色”能否创建 `workflow_tester`。
   - 已按黑盒方式实际执行创建角色接口链路，不涉及 `../workflow` 代码修改。
1243. Maintenance notes（第一次验收尝试）：
   - 新会话 `rcs-20260327-102534-c1fbb0` 中，若通过当前直连接口发送中文画像文本，服务端最终保存的用户消息会退化为连续 `????`。
   - 结果是 `role_spec` 全空、`can_start=false`，`/start` 返回 `409 role_creation_spec_incomplete`。
   - 这说明当前链路至少存在“接口中文请求体进入创建角色会话后被乱码化”的黑盒风险。
1244. Maintenance notes（第二次验收尝试）：
   - 改用纯 ASCII 结构化画像后，新会话 `rcs-20260327-102733-1e2d4b` 成功收口：
     1. `role_spec.role_name=workflow_tester`
     2. `missing_fields=[]`
     3. `can_start=true`
   - 随后 `/start` 成功，创建了：
     1. `created_agent_id=workflow_tester`
     2. `assignment_ticket_id=asg-20260327-102824-8a62bd`
     3. `created_agent_workspace_path=C:/work/J-Agents/work-low_tester`
1245. Maintenance notes（可工作性观察）：
   - 启动后约 35 秒复查，首个任务 `rc-47b7c8-collect` 已进入 `running`，说明 `workflow_tester` 不只是被登记出来，至少已开始接手创建流程下的真实后台任务。
   - 再等待约 65 秒后，该任务仍处于 `running`，尚未产出 `artifact_paths` 或 `result_ref`；因此当前可判定为“创建成功并已开始工作”，但尚不能判定“已完成首个任务并完全可用”。
1246. Maintenance notes（证据落盘）：
   - 本轮黑盒验收证据已写入：
     1. `C:/work/J-Agents/Analyst/.test/role-creation-acceptance-20260327-102534/`
     2. `C:/work/J-Agents/Analyst/.test/role-creation-acceptance-20260327-102733/`
1247. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好；用户本轮诉求属于“要求在不改代码前提下做真实黑盒验收”，与既有“实现与验收分离”倾向一致，先记流水，不单独升格为新偏好条目。
1248. Maintenance notes（缺陷记录落盘）：
   - 用户要求把本轮黑盒验收发现的 bug 录入 `需求与缺陷 -> 缺陷` 列表。
   - 已通过真实 `/api/defects` 链路提交“创建角色中文输入变成 `???` 并阻断启动”的问题。
1249. Maintenance notes（缺陷编号与状态）：
   - 初次提交时，系统把该记录误判为 `not_formal`；
   - 随后已补充“这是确认过的 bug/failure”说明，并通过 `/api/defects/{report_id}/dispute` 将其转入正式缺陷链路；
   - 当前编号：`DTS-00005`
   - 当前 `report_id`：`dr-20260327-f0cc7258f9`
   - 当前状态：`有分歧 / dispute`
1250. Maintenance notes（缺陷内容）：
   - 缺陷主题：`[Create Role][P0] Chinese input becomes ??? and blocks start`
   - 关键证据：
     1. 中文画像会话 `rcs-20260327-102534-c1fbb0` 中，消息落盘为 `????...`，`role_spec` 为空，`/start` 返回 `409 role_creation_spec_incomplete`
     2. 对照会话 `rcs-20260327-102733-1e2d4b` 的 ASCII 画像可成功创建 `workflow_tester` 并启动任务图 `asg-20260327-102824-8a62bd`
1251. Maintenance notes（证据路径）：
   - 缺陷提交与转分歧证据已落盘：
     1. `C:/work/J-Agents/Analyst/.test/defect-submit-20260327-create-role-chinese-input/01-submit-response.json`
     2. `C:/work/J-Agents/Analyst/.test/defect-submit-20260327-create-role-chinese-input/02-supplement-response.json`
     3. `C:/work/J-Agents/Analyst/.test/defect-submit-20260327-create-role-chinese-input/03-dispute-response.json`
1252. Maintenance notes（角色名称异常归因复核）：
   - 用户进一步追问实际创建结果里为什么出现 `work-low_tester`，要求区分“我输入打错”还是“系统执行异常”。
   - 本轮复核后确认：
     1. 真实会话 `rcs-20260327-102733-1e2d4b` 中，`created_agent_id=workflow_tester`
     2. 同一会话中，`created_agent_name=workflow_tester`
     3. 只有 `created_agent_workspace_path` 变成 `C:/work/J-Agents/work-low_tester`
   - 这说明异常不在用户输入名称本身，而在运行中的角色创建链路对工作区目录名的生成或落盘上。
1253. Maintenance notes（实现侧比对结论）：
   - 复核当前源码后，`_role_creation_title_from_spec` 与 `_workspace_dir_name` 按现有逻辑本应直接保留 `workflow_tester`，未见会把它转换成 `work-low_tester` 的显式规则。
   - 因此当前更合理的判断是：
     1. 8090 运行实例存在实现缺陷，或
     2. 8090 运行版本与当前工作区源码存在漂移/不一致
   - 本轮仍先记为“运行侧异常，非输入打错”；若要正式追踪，建议把“工作区目录名被异常改写”为单独缺陷。
1254. Maintenance notes（需求与缺陷界面设计一致性复核）：
   - 用户要求顺便检查 `需求与缺陷` 实际界面与此前设计是否存在大差异。
   - 本轮对比对象包含：
     1. `Analyst` 侧 2026-03-27 更新后的最新原型 HTML
     2. `workflow` 侧 2026-03-27 11:51 生成的真实浏览器截图与 probe
     3. 当前前端实现源码
   - 结论：相对 2026-03-27 收口后的最新设计口径，不存在大的结构性偏差；标题栏总开关、详情区顺序建单摘要、旧条带移除、全局单主动处理位等主要求已对齐。
1255. Maintenance notes（界面小差异）：
   - 当前实际界面与最新设计的主要差异是：
     1. 标题栏按钮文案从原型的“总开关 已开启/已关闭”调整为“按顺序创建任务：开启/关闭”
     2. “提交缺陷”卡在真实界面中会在有列表记录且当前无草稿时默认折叠，原型中默认保持展开
     3. 真实界面整体比原型更紧凑、更扁平，这与用户此前要求一致
   - 同时注意：原型目录里的 `需求与缺陷模块参考图.png` 仍是 2026-03-23 的旧截图，若拿旧 PNG 对比会误判为偏差较大；当前有效设计应以 2026-03-27 更新后的 HTML 为准。
1256. Maintenance notes（边界澄清）：
   - 用户本轮明确澄清：不允许我改动其他工作区实现，但允许我直接使用 `8090` 应用做真实黑盒操作。
   - 因此本轮执行口径从“只交执行提示词”切换为“可直接使用应用验收，但仍不改 `../workflow` 代码与脚本”。
1257. Maintenance notes（真实创建结果）：
   - 已按 `http://127.0.0.1:8090` 当前真实接口先探测现状，再在确认缺失后创建 `workflow_tester`。
   - 本轮新建会话：`rcs-20260327-221113-1110e0`。
   - 本轮新建任务图：`asg-20260327-221156-d84991`。
   - 当前创建结果：`created_agent_id=workflow_tester`，`created_agent_workspace_path=D:/code/AI/J-Agents/workflow_tester`，阶段 1 已完成，阶段 2 已进入 `creating`。
1258. Maintenance notes（首轮真实探测失败）：
   - 已继续用 `workflow_tester` 创建真实会话 `sess-web-20260327-222529-1b13b1`，并下发首轮低风险黑盒巡检任务。
   - 真实任务 `task-20260327-9f356109` 在 102ms 内直接失败，`task_summary=AttributeError: 'SessionLockEntry' object has no attribute 'acquire'`。
   - 失败发生在真正产出 assistant 回复前；当前会话仅落下用户消息，未进入正常探测执行。
   - 证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-222226-333/artifacts/`。
1259. Maintenance notes（缺陷已落盘）：
   - 已通过真实 `/api/defects` 链路提交该问题，当前正式记录为：
     1. `report_id=dr-20260327-fc1b947def`
     2. `display_id=DTS-00001`
     3. `task_priority=P0`
     4. `status=unresolved`
   - 缺陷主题：`[workflow_tester][P0] First probe task fails with SessionLockEntry.acquire AttributeError`。
   - 提交证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-222810-793/artifacts/`。
1260. Maintenance notes（偏好结论）：
   - 本轮未新增 owner 已确认长期偏好。
   - “允许直接使用应用做黑盒验收，但不改实现”当前先按任务边界记录为本轮明确约束，不单独升格为跨主题长期偏好。
1261. Maintenance notes（任务图恢复前置条件）：
   - 继续围绕 `DTS-00001` 的处理任务图做黑盒验证时，确认 `POST /api/assignments/asg-20260327-223335-b79f27/resume` 为必要前置动作。
   - 先前直接调用 `dispatch-next` 返回 `200` 但 `message=scheduler_not_running`，本轮在同一任务图上先 `resume` 后再调度，scheduler 状态成功从 `idle` 切到 `running`。
1262. Maintenance notes（缺陷处理链路已真实起跑）：
   - `resume` 后，分析节点 `dr-20260327-fc1b947def-analyze` 已从 `ready` 进入 `running`。
   - 真实执行批次为 `arun-20260327-224100-db252f`，分派对象为 `workflow`，工作区为 `D:/code/AI/J-Agents/workflow`。
   - 对应黑盒证据已落盘到 `D:/code/AI/J-Agents/Analyst/.test/20260327-224221-291/artifacts/`。
1263. Maintenance notes（运行中分析结论已可见）：
   - 通过只读轮询可见，分析任务正在读取 `workflow` 侧相关实现与本轮故障证据，且已在运行事件中产出明确结论草稿。
   - 事件中给出的核心结论是：通用 `C:/work/J-Agents/.output/tasks/execute` worker 在 `SessionLockEntry` 锁封装重构后仍沿用旧的 `lock.acquire()/lock.release()` 调用，导致同路径任务在启动前失败；聊天接口未受同样影响。
   - 该结论当前来自运行中任务的事件内容，属于“运行时可见中间产物”，不是我在本工作区直接改码或人工复核后的最终结论。
1264. Maintenance notes（新观察的运行风险）：
   - 截至本轮结束，分析 run `arun-20260327-224100-db252f` 已持续运行约 15 分钟以上，最新事件显示其已经开始序列化 `result_summary` 与 `分析缺陷报告.html`，但节点状态仍停留在 `running`，`node_result_ref` 与 `artifact_paths` 仍为空。
   - 该现象当前先记为“疑似运行态未闭合风险/待继续观察”，暂未单独升级为正式缺陷。
1265. Maintenance notes（偏好结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 用户本轮连续要求“继续”推进，当前更适合作为任务推进节奏观察，先记流水，不单独升格为跨主题长期偏好。
1266. Maintenance notes（分析节点最终收尾）：
   - 在后续短轮询中，`dr-20260327-fc1b947def-analyze` 已成功从 `running` 切到 `succeeded`。
   - 对应执行批次 `arun-20260327-224100-db252f` 的 `finished_at=2026-03-27T22:59:22+08:00`，`node_result_ref` 已回写，`artifact_paths` 已落出。
   - 终态证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-225939-094/artifacts/`。
1267. Maintenance notes（当前结论收口）：
   - 当前可确认两件事：
     1. `workflow_tester` 首轮真实探测失败的正式缺陷 `DTS-00001` 仍成立；
     2. 其处理任务图并非“不可执行”，而是需要先 `resume` 才能调度，且分析节点最终已成功交付 `分析缺陷报告.html`。
   - 因此本轮不再把“分析 run 长时间 running”升级为新缺陷，先视为已完成的长时执行观察。
1268. Maintenance notes（修复节点已自动接棒）：
   - 在分析节点成功后，任务图未停住，而是由 `assignment-executor` 自动派发了后继修复节点 `dr-20260327-fc1b947def-fix`。
   - 当前修复 run 为 `arun-20260327-225945-80da1b`，于 `2026-03-27T22:59:34+08:00` 启动，状态已进入 `running`。
   - 这说明在 `resume` 之后，该全局任务图具备自动串行推进能力，不需要我再次手动 `dispatch-next`。
1269. Maintenance notes（修复节点超时失败）：
   - 持续黑盒观察后，`dr-20260327-fc1b947def-fix` 最终没有成功收尾，而是在 `2026-03-27T23:19:47+08:00` 以 `assignment execution timeout after 1200s` 失败。
   - 该失败直接导致下游发布节点 `dr-20260327-fc1b947def-release` 转为 `blocked`，阻塞原因是 `upstream_failed`。
   - 终态证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-231844-225/artifacts/`。
1270. Maintenance notes（原始故障即时回测仍复现）：
   - 在修复节点超时后，已立即重新通过 `workflow_tester` 发起真实黑盒任务回测。
   - 新会话 `sess-web-20260327-232020-a7e191` 的真实任务 `task-20260327-d8b10e5f` 仍然以 `AttributeError: 'SessionLockEntry' object has no attribute 'acquire'` 失败，说明 `8090` 对外运行面上的原始故障并未消失。
   - 回测证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-232020-167/artifacts/`。
1271. Maintenance notes（原缺陷已补充新证据）：
   - 已将“修复链超时 + 线上即时回测仍复现”的新证据作为文字补充挂到 `DTS-00001 / dr-20260327-fc1b947def`。
   - 补充响应与最新 defect 详情证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-232251-046/artifacts/`。
1272. Maintenance notes（新增第二缺陷）：
   - 由于“修复链超时并阻塞 release”已形成独立问题，已正式提交第二个缺陷：
     1. `report_id=dr-20260327-5b159b7ae1`
     2. `display_id=DTS-00002`
     3. `task_priority=P0`
     4. `status=unresolved`
   - 新缺陷主题聚焦 assignment/process 链路：修复节点在本地 smoke 已通过后仍超时失败，且 release 被阻塞。
   - 提交证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-232518-310/artifacts/`。
1273. Maintenance notes（偏好结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 用户继续要求“直接往下推进并黑盒验证”的行为模式再次出现，但当前仍按任务推进节奏记录，不单独升格为长期偏好。
1274. Maintenance notes（修复任务失败原因复盘）：
   - 本轮继续复核 `dr-20260327-fc1b947def-fix / arun-20260327-225945-80da1b` 的直接失败原因。
   - 当前可确认其最终失败不是因为 `stderr` 中出现了新的 Python 异常；`stderr.txt` 长度为 0。
   - 任务图给出的直接失败原因是：`assignment execution timeout after 1200s`，运行批次以 `exit_code=124` 收尾，节点完成时间为 `2026-03-27T23:19:47+08:00`。
1275. Maintenance notes（修复任务失败前的真实进展）：
   - `stdout` 事件显示该修复 run 并非一直空转：
     1. `23:15:40` 已实际修改 `src/workflow_app/server/services/task_orchestration.py`
     2. `23:16:55` 真实 `task_execute_lock_smoke` 已返回两轮 `success`
     3. `23:17:20` agent 自述“代码修复和真实 smoke 已通过”
   - 这说明 run 在业务修复与最小 smoke 层面已经前进到接近收尾，而不是一开始就卡死。
1276. Maintenance notes（导致超时的主要拖延项）：
   - 从 `22:59:34` 启动到 `23:15:40` 首次落下代码变更前，run 已消耗约 16 分钟在治理文件读取、成因追查、门禁脚本检查与路径回退梳理上。
   - 中途还出现两个明显耗时点：
     1. `workflow_gate` 验收先被 `workspace line budget triggered refactor_skill` 拦下，并未直接服务于本次 P0 修复闭环；
     2. 首次内联 smoke 命令因引号/命令拼接问题失败，后续才改为 `.test/task_execute_lock_smoke.py` 成功执行。
   - 在确认 smoke 已通过后，run 又于 `23:18:53` 启动了一次额外的 `workspace-scoped smoke`，该命令尚未完成即被 1200 秒总超时切断。
1277. Maintenance notes（当前结论）：
   - 本轮结论是：修复任务失败的主因是“在固定 1200 秒 assignment 执行预算内未完成收尾”，而不是“修复代码本身再次抛出明确异常”。
   - 推断/假设（高）：由于 fix 节点在生成正式修复说明与 release 前被超时杀掉，修复结果没有完整进入发布链，这也是 `8090` 上原始故障仍然即时复现的重要原因。
1278. Maintenance notes（创建角色画像执行失败已核实）：
   - 用户追加指出“创建角色的画像也有执行失败”。本轮已在 `8090` 上复核现有真实创建会话 `rcs-20260327-221113-1110e0` 与其任务图 `asg-20260327-221156-d84991`。
   - 结论是：该创建流程当前确实卡在 `persona_collection`，不是停留在“未开始”，而是首个画像任务 `rc-a9eacd-collect` 已真实失败。
   - 节点终态：`status=failed`、`failure_reason=assignment execution failed with exit=1`；其下游 `rc-a9eacd-profile` 已被阻塞。
1279. Maintenance notes（画像任务失败细节）：
   - 失败 run 为 `arun-20260327-221157-1ef94c`。
   - 运行事件显示两层显著异常：
     1. 它在新建的 `workflow_tester` 工作区里读取 `./.codex/skills/workspace-memory-context/SKILL.md` 时触发 `PathNotFound`；
     2. 随后出现连续 5 次以上 `stream disconnected before completion: error sending request for url (https://gmn.chuangzuoli.com/responses)`，最终 `turn.failed` 并以 `exit=1` 收尾。
   - 因此当前可见失败链并非单一原因，而是“工作区内预期技能缺失 + 上游响应流断开”共同出现在同一真实 run 中。
1280. Maintenance notes（新缺陷已登记）：
   - 已将该问题正式登记为新的缺陷记录：
     1. `report_id=dr-20260327-16a4fa716a`
     2. `display_id=DTS-00003`
     3. `task_priority=P0`
     4. `status=dispute`
   - 当前缺陷主题聚焦“创建角色在画像收集阶段真实执行失败并阻塞后续画像链路”。
   - 提交证据目录：`D:/code/AI/J-Agents/Analyst/.test/20260327-233653-364/artifacts/`。
1281. Maintenance notes（偏好结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 用户持续沿真实链路逐段追 bug，当前继续按“黑盒推进优先”记录为任务推进方式，不单独升格为长期偏好。
1282. Maintenance notes（新增协作偏好）：
   - 用户本轮明确要求：后续提缺陷、补充缺陷、以及通过真实链路创建或驱动 agent 时，默认使用中文。
   - 该要求属于 owner 明示协作偏好，且会直接影响后续真实提单与探测脚本的默认文案，建议升格为长期协作偏好。
1283. Maintenance notes（中文默认值已落到本地工具）：
   - 已仅在 `Analyst/.tmp/` 辅助脚本内完成默认文案收口：
     1. 缺陷标题、正文、supplement/dispute 原因改为中文；
     2. `workflow_tester` 探测提示词与会话策略兜底文案改为中文；
     3. 创建 `workflow_tester` 的角色画像默认值改为“兼容键名 + 中文内容”。
   - 本轮未改动 `../workflow` 实现代码，仍保持黑盒边界。
1284. Maintenance notes（DTS-00001 串行复测新状态）：
   - `dr-20260327-fc1b947def-fix` 的 rerun `arun-20260327-233539-db6254` 已在 `2026-03-27T23:49:46+08:00` 成功收尾；其 `result.json` 明确声称：运行副本已修复并通过隔离烟测。
   - 但下游 `dr-20260327-fc1b947def-release` 当前失败，failure_reason 为“运行句柄缺失或 workflow 已重启，请手动重跑”，说明卡点已从 `fix` 转移到 `release`。
   - 随后按串行方式再次对 live `8090` 做真实黑盒回归，会话 `sess-web-20260327-235610-0af87f`、任务 `task-20260327-34fd575f` 仍然报 `AttributeError: 'SessionLockEntry' object has no attribute 'acquire'`，说明线上运行面尚未真正吃到修复结果。
1285. Maintenance notes（缺陷提任务命名能力已核实）：
   - 用户追问：缺陷处理时去任务中心提任务，是否可以指定任务名称，而不是固定生成“分析缺陷”。
   - 本轮通过只读核对 `../workflow` 当前实现确认：
     1. 任务中心手工建任务支持自定义 `node_name`；
     2. 缺陷中心 `process-task` 前端当前仅提交 `operator`；
     3. 后端 `create_defect_process_task(...)` 当前仅消费 `operator / auto_queue / assigned_agent_id`，未接收自定义任务名；
     4. 处理链节点标题固定写死为“分析缺陷 / 修复缺陷 / 推送到目标版本”。
   - 当前结论：任务中心手工建任务可以指定名称；缺陷处理自动提任务到任务中心这条链路当前不能指定自定义名称。
1286. Maintenance notes（偏好归属结论）：
   - 本轮未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前对“任务名称可控”有明确关注，但更像对 `workflow` 的即时产品能力诉求，而非已稳定沉淀的个人长期偏好；暂不写入长期偏好主档。
1287. Maintenance notes（任务名称“应支持”与“现支持”已区分）：
   - 用户进一步指出：提 bug 后仍需 agent 判定，判定为正式缺陷后，任务名称理论上完全可以指定。
   - 本轮补查确认：`defect_reports` 确实保存 `defect_summary`，缺陷中心列表与详情也会展示该摘要；但 `process-task` 建任务链时未读取 `defect_summary` 参与 `node_name` 生成。
   - 当前结论因此收敛为两层：
     1. 产品/业务逻辑上，这个能力完全说得通，且应当支持；
     2. 但按当前代码实现，它还没有真正落地，既不支持前端显式传入自定义任务名，也不支持自动用缺陷摘要派生任务名。
1288. Maintenance notes（缺陷处理任务命名需求已落文档）：
   - 用户确认继续后，本轮未改动 `../workflow`，仅在 `Analyst/docs/workflow/` 内完成需求收口。
   - 已新增 `docs/workflow/requirements/需求详情-缺陷处理任务命名可指定.md`，并同步更新 `docs/workflow/overview/需求概述.md` 索引与增量节。
   - 当前文档口径收敛为：
     1. 缺陷确认后，`处理缺陷 / 提交复核` 两条链路都必须支持任务名称确认；
     2. 默认任务名称基名优先使用 `DTS 展示编号 + 缺陷摘要`；
     3. 自动顺序建单也必须使用语义化命名，不得回退成固定通用名；
     4. 命名变化不得突破既有 `report_id + action_kind` 幂等约束。
1289. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前更关注“缺陷处理链是否具备业务语义和串行可追踪性”，这已体现在需求文档约束中，但暂不单独升格为新的长期偏好条目。
1290. Maintenance notes（已交付 ../workflow 执行提示词）：
   - 用户要求把“缺陷处理任务命名可指定”交付给 `../workflow`。
   - 本轮在 `Analyst/docs/workflow/prompts/` 内新增中文执行提示词：`执行提示词-缺陷处理任务命名可指定开工-20260328.md`。
   - 提示词已明确：
     1. 缺陷确认后，`处理缺陷 / 提交复核` 都要支持建单前任务名称确认；
     2. 默认命名优先采用 `DTS 展示编号 + 缺陷摘要`；
     3. 自动顺序建单也必须沿用同一命名真相源；
     4. 名称能力不得破坏既有串行门禁与幂等防重复建链约束。
1291. Maintenance notes（prompts 目录清理已执行）：
   - 按 `docs/workflow/prompts/README.md` 的目录保留规则，本轮新增提示词后仅保留最近 7 轮提示词。
   - 已删除最旧历史提示词：`docs/workflow/prompts/执行提示词-需求与缺陷模块缺陷闭环首期开工-20260322.md`。
   - 当前 `docs/workflow/prompts/` 下保留 7 份执行提示词 + 1 份 `README.md`。
1292. Maintenance notes（全局唯一任务图需求已上升为任务中心总原则）：
   - 用户补充要求：`../workflow` 的任务中心中展示的任务图应收敛为全局只有一张。
   - 本轮已在 `Analyst/docs/workflow/` 中把该要求从“缺陷任务挂全局主图”升级为“任务中心整体只保留全局唯一任务图”的正式需求。
   - 已更新文档：
     1. `docs/workflow/requirements/需求详情-任务中心与依赖可视化编排.md`
     2. `docs/workflow/requirements/需求详情-任务中心后端接口与调度规则.md`
     3. `docs/workflow/requirements/需求详情-任务中心真实执行化与执行链路可视化.md`
     4. `docs/workflow/requirements/需求详情-定时任务模块与日历视图.md`
     5. `docs/workflow/overview/需求概述.md`
   - 当前口径已明确：
     1. 页面只展示 1 张全局唯一任务图；
     2. 若保留 `ticket_id`，必须稳定指向该唯一任务图；
     3. 外部模块统一改为“向全局图追加节点/依赖”；
     4. `定时任务` 也不再创建新的单任务实例图，而是向全局图追加单任务节点。
1293. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户对“全局唯一真相源”的要求已稳定体现在任务中心与缺陷治理文档约束中，但目前仍属于产品机制要求，不单独升格为新的长期个人偏好条目。
1294. Maintenance notes（已补可交付给 ../workflow 的同步检查提示词）：
   - 用户进一步要求：同步到 `../workflow` 并让其先做一次检查。
   - 受 `Analyst` 职责边界限制，本轮未直接写入或驱动 `../workflow` 工作区；改为在 `Analyst/docs/workflow/prompts/` 内新增可直接转发的中文检查提示词：
     1. `docs/workflow/prompts/执行提示词-任务中心全局唯一任务图同步检查-20260328.md`
   - 提示词要求 `../workflow` 先按“任务中心全局唯一任务图”新口径做差异检查，重点覆盖：
     1. 任务中心前端是否仍存在多图入口；
     2. `/api/assignments` 是否仍会创建新图；
     3. 缺陷与定时任务是否仍可能生成新的独立活动图；
     4. 历史数据与恢复逻辑是否仍会扫出多图。
1295. Maintenance notes（prompts 目录已再次按规则收口）：
   - 本轮新增检查提示词后，按 `docs/workflow/prompts/README.md` 保留最近 7 轮提示词。
   - 已删除最旧历史提示词：`docs/workflow/prompts/执行提示词-定时任务模块与日历视图开工-20260323.md`。
   - 当前 `docs/workflow/prompts/` 下继续保持 7 份执行提示词 + 1 份 `README.md`。
1296. Maintenance notes（三模块任务中心落点已做代码+运行态复核）：
   - 用户追问：训练中心、定时任务、需求与缺陷三个大模块里，凡会创建任务中心任务的链路，是否都已经排查完。
   - 本轮补齐只读核查，结论分层如下：
     1. 代码层：`需求与缺陷`、`定时任务`、`训练中心（创建角色）` 当前源码都已定位到对应落任务入口，并且三者都指向 `workflow-ui-global-graph-v1` 这张全局主图；
     2. 运行态：`8090` 当前 `/api/assignments?limit=24` 仍返回 3 张任务图，其中包含一张 `source_workflow=training-role-creation` 的独立训练中心旧图，以及一张旧的 `workflow-ui` 主图；
     3. 因此，“三个模块的创建入口是否排查到”可以回答为“已完成本轮核查”，但“任务中心是否已经收敛到全局唯一任务图”不能回答为“已经完成”。
   - 当前最关键事实：
     1. `需求与缺陷` 已有真实运行证据落在 `任务中心全局主图`；
     2. `训练中心` 现有存量 `workflow_tester` 会话仍绑定独立旧图；
     3. `定时任务` 代码已改为向全局图追加节点，但当前 prod 运行态没有现成 schedule 数据可做同层级实证。
1297. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前更在意“不要把代码层已改好”和“运行态已经完全收敛”混为一谈；该要求已体现在本轮结论表达方式中，暂不单独升格为新的长期偏好条目。
1298. Maintenance notes（docs/workflow 已同步到 ../workflow）：
   - 用户要求先把当前 `Analyst/docs/workflow` 中与“缺陷处理任务命名可指定”“任务中心全局唯一任务图”相关的最新文档同步到 `../workflow`，再由其执行工作区继续处理。
   - 本轮已实际同步并校验哈希一致的文件包括：
     1. `overview/需求概述.md`
     2. `requirements/需求详情-缺陷处理任务命名可指定.md`
     3. `requirements/需求详情-任务中心与依赖可视化编排.md`
     4. `requirements/需求详情-任务中心后端接口与调度规则.md`
     5. `requirements/需求详情-任务中心真实执行化与执行链路可视化.md`
     6. `requirements/需求详情-定时任务模块与日历视图.md`
     7. `prompts/执行提示词-缺陷处理任务命名可指定开工-20260328.md`
     8. `prompts/执行提示词-任务中心全局唯一任务图同步检查-20260328.md`
   - 同时已将 `../workflow/docs/workflow/prompts/` 中两份已在 Analyst 侧淘汰的旧提示词删除，使两边提示词集合重新对齐。
1299. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前更关注“文档同步后即可直接驱动执行工作区开工”的交付完整性；这属于当前任务目标，不单独升格为长期偏好。
1300. Maintenance notes（../workflow 对话中断原因已做只读复盘）：
   - 用户追问：`../workflow` 工作区中的对话为什么会在工作过程中突然中断。
   - 本轮核查到两类不同现象：
     1. 2026-03-27 晚上的 `workflow_tester` 真实对话任务并非“被用户中断”，而是后台 `task execute` 在 81~133ms 内直接失败，`summary` 一致为 `AttributeError: 'SessionLockEntry' object has no attribute 'acquire'`；
     2. 2026-03-28 17:32:42 +08:00 prod 环境又发生过一次成功升级切换，若用户说的是该时间点附近的工作中断，则服务重启本身也会打断正在进行的工作区对话。
   - 当前更强结论：
     1. 若指向 2026-03-27 那批 `workflow_tester` 会话，根因是旧的 8090 运行进程未加载锁修复补丁，表现成“刚开始就断了”；  
     2. 若指向 2026-03-28 17:32 左右的中断，则根因更可能是 prod 升级切换导致的进程重启。
1301. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前在意的是“把体感上的中断”和系统真实失败模式区分清楚”，这属于当前问题定位需要，暂不升格为长期偏好。

## 2026-03-28
1302. Maintenance notes（../workflow 会话中断问题已按真实对象纠偏）：
   - 用户明确澄清：本次要分析的是“和 `../workflow` 像当前聊天一样的会话，在执行到一半时突然中断”，不是 `workflow` 产品里另一类缺陷任务立即失败的问题。
   - 因此本轮排查已把主问题切回“聊天连续性 / 会话恢复链路”，不再把 `/api/tasks/execute` 的旧失败直接当成主结论。
1303. Maintenance notes（会话中断主因与版本证据已收口）：
   - 只读核查 `../workflow` 记忆、源码、验收脚本、发布记录与当前 8090 运行态后，确认更贴近用户体感的主因是：旧 prod 版本在刷新、重连或切回会话时，未基于 session task-run 恢复 `runningTasks` 与占位消息，导致任务仍在或刚结束时，前端看起来像“执行到一半突然断掉”。
   - 证据包括：
     1. `../workflow/.codex/memory/2026-03/2026-03-28.md` 已记录“聊天任务断线恢复与占位态收口”，并明确生成 test 候选 `20260328-212746`；
     2. `../workflow/src/workflow_app/web_client/policy_confirm_and_interactions.js` 已新增 `nonPlaceholderAssistantContent / ensureRecoveredTaskMessage / recoverSessionTaskRuntime`，而当前 `../workflow/.running/prod/src/.../policy_confirm_and_interactions.js` 仍缺少这段恢复逻辑；
     3. `../workflow/scripts/acceptance/run_acceptance_chat_task_recovery_smoke.js` 已覆盖“运行中恢复 / 失败恢复 / 空结果恢复 / 占位态收口”；
     4. 当前 `http://127.0.0.1:8090/api/runtime-upgrade/status` 显示 prod 仍是 `20260328-151525`，候选版才是 `20260328-212746`，说明修复已进 test 候选但尚未上线 prod。
1304. Maintenance notes（补充根因分层）：
   - 若用户遇到的中断发生在 `2026-03-28 17:32:39 ~ 17:32:42 +08:00` 附近，则还需要叠加考虑 prod 升级切换带来的服务重启，因为当前 8090 进程启动时间与 `prod-last-action` 中该次升级完成时间一致。
   - 若不是该时间窗，当前更高置信度解释仍是“旧 prod 缺少聊天任务恢复逻辑”，而不是“服务当时一定崩了”。
1305. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前更重视“要把问题对象先对准，再给版本级证据闭环”，这属于本轮分析质量要求，暂不单独升格为长期偏好条目。
1306. Maintenance notes（8090 上未完成角色创建已继续收口）：
   - 用户要求直接去 `http://127.0.0.1:8090` 继续完成此前没收口的角色创建，而不是继续停留在只读分析。
   - 本轮按黑盒方式实际操作 8090 现网接口，不改 `../workflow` 代码，只对现有创建会话做状态推进与完成确认。
1307. Maintenance notes（workflow_tester 创建会话已正式完成）：
   - 定位到未收口会话 `rcs-20260327-221113-1110e0`，其创建状态此前卡在 `persona_collection`，根因不是缺画像字段，而是 4 个自动背景任务中首个 `rc-a9eacd-collect` 失败，后续节点阻塞/待执行，导致 `/complete` 会被未完成任务门禁拦住。
   - 本轮在 8090 侧顺序执行：
     1. 将 `rc-a9eacd-collect / rc-a9eacd-profile / rc-a9eacd-capability / rc-a9eacd-review` 依次归档为废案收纳；
     2. 随后调用完成接口确认收口。
   - 当前复核结果：
     1. 该会话 `status=completed`；
     2. `current_stage_key=complete_creation`；
     3. `completed_at=2026-03-28T22:34:19+08:00`；
     4. `created_agent.runtime_status=idle`；
     5. 角色工作区仍为 `D:/code/AI/J-Agents/workflow_tester`。
1308. Maintenance notes（留痕与残留说明）：
   - 本轮黑盒操作留痕已写入 `.test/20260328-223415-537/`，包含归档前后、完成响应、agent 列表与 session 列表证据。
   - 需明确区分：角色创建会话已完成，不代表旧任务图中的失败/阻塞历史节点被物理删除；这些节点作为历史记录仍可见，但已经不再阻塞本次创建会话状态。
1309. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前更关注“直接把现网卡住的流程推进到完成态，并保留完整证据”，该要求与既有“真实执行 + 留痕复盘”偏好一致，先记流水，不单独升格为新长期偏好。

## 2026-03-29
1310. Maintenance notes（8090 角色画像可编辑边界已核实）：
   - 用户追问是否可以直接在 `http://127.0.0.1:8090` 上把 `workflow_tester` 的角色画像改成中文，并进一步希望连 `AGENTS.md` 正文也通过 8090 改掉。
   - 本轮只读核查 live 接口与 `../workflow` 源码后确认：
     1. 训练中心当前没有“手工编辑角色画像字段”的表单或请求载荷；
     2. `release-review/manual` 仅提交 `decision / reviewer / review_comment / operator`；
     3. `release-review/confirm` 只是基于已生成的发布报告执行发布并绑定 `active_role_profile_ref`；
     4. 8090 当前也没有编辑工作区 `AGENTS.md` 的入口。
1311. Maintenance notes（角色画像可通过发布链间接换源，但不是手工改字）：
   - 当前 `workflow_tester` live 数据仍是 `role_profile.profile_source=structured_fields_fallback`，且 `releases=[]`，说明详情页正文现在仍回退到工作区结构化字段。
   - 同时已核实发布评审提示词默认要求输出中文语境下的第一人称发布报告；因此 8090 现有能力更准确的边界是：
     1. 不能直接手工编辑画像正文；
     2. 可以通过“进入发布评审 -> 生成发布报告 -> 确认发布”间接生成并绑定一份新的正式发布画像；
     3. 但这条链不能改 `AGENTS.md`，也不能保证每个技能名都会按用户期望精确中文化。
1312. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前更在意“功能边界要说清楚，尤其区分可手工编辑与只能间接生成”，这属于本轮边界澄清要求，暂不升格为长期偏好。
1313. Maintenance notes（角色中心与训练优化需求已收敛成正式口径）：
   - 用户明确确认：
     1. `训练中心` 可以升级命名为 `角色中心`；
     2. `训练优化` 应采用与 `创建角色` 同类的对话式工作流；
     3. 训练优化允许并行推进；
     4. 训练优化允许回写 `AGENTS.md`；
     5. 训练优化可自动进入发布评审与推送；
     6. `创建角色` 与 `训练优化` 都必须补齐能力验收门禁；
     7. `训练优化` 必须额外保证历史功能无明显退化。
1314. Maintenance notes（本轮文档交付范围）：
   - 已更新 `docs/workflow/overview/需求概述.md`，补入 `角色中心（原训练中心）`、`训练优化` 对话式闭环、共享门禁与历史能力防退化口径。
   - 已新增 `docs/workflow/requirements/需求详情-角色中心与训练优化工作流.md`，收口模块命名、并行优化、`AGENTS.md` 回写、自动发布评审/推送、共享门禁、历史能力防退化门禁。
   - 已更新 `docs/workflow/requirements/需求详情-创建角色工作流与任务绑定.md`，将 `创建角色` 接入共享能力验收门禁，并同步改为 `角色中心` 子模块语义。
   - 已更新 `docs/workflow/requirements/需求详情-角色画像发布格式与预发布判定.md` 的现行主称呼，减少后续同步歧义。
1315. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增 owner 已确认长期偏好。
   - 推断/假设（中）：用户当前更偏好“先把工作流、门禁和回写边界一次收清，再交给执行工作区”，这属于当前主题下的需求收敛策略，先记流水，不单独升格为长期偏好。
1316. Maintenance notes（训练优化原型与能力列表口径已补齐）：
   - 本轮已新增原型 `docs/workflow/prototypes/role-opt.html`，用于收口 `训练优化` 的正式展示方向。
   - 原型当前明确采用：
     1. 左侧优化会话列表；
     2. 中部单聊天壳；
     3. 中部聊天壳内直接回收“本轮能力列表”；
     4. 右侧默认激活 `任务 / 能力演进`，`当前能力基线` 作为第二标签。
   - 能力列表中的每条能力项都已同时展示：能力名、状态、效果预览、能力评分、门禁状态、历史能力影响。
1317. Maintenance notes（正式需求已补“能力对象模型 + 列表规则 + 门禁绑定”）：
   - 已更新 `docs/workflow/requirements/需求详情-角色中心与训练优化工作流.md`，新增：
     1. `FR-RO-18 能力对象模型`；
     2. `FR-RO-19 能力列表展示规则`；
     3. `FR-RO-20 能力展示效果与评分绑定`；
     4. `FR-RO-21 历史能力回归结果展示`；
     5. `AC-RO-12 ~ AC-RO-15` 对应验收标准。
1318. Maintenance notes（偏好归属结论）：
   - 用户本轮明确要求：
     1. `训练优化` 当前阶段先用“能力列表”作为主展示；
     2. 每条能力必须同时展示“效果证据 + 能力评分”；
     3. 右侧默认先看 `任务 / 能力演进`，而不是先看门禁说明。
   - 归属判定：`owner_confirmed`。
   - 处理动作：先记入变更日志；推断/假设（中）：该偏好目前主要稳定于“训练优化/角色中心”主题，暂不直接升格到长期偏好主档，后续若跨主题复现再升级。
1319. Maintenance notes（已新增可交付 ../workflow 的训练优化执行提示词）：
   - 本轮已新增 `docs/workflow/prompts/执行提示词-角色中心训练优化能力列表与门禁绑定开工-20260329.md`。
   - 提示词已明确要求执行工作区按当前正式需求实现：
     1. 训练优化页能力对象模型；
     2. 中部聊天壳内的能力列表主视图；
     3. 每项能力同时展示效果证据与评分；
     4. `Gate-B / Gate-C` 绑定到具体能力项；
     5. 右侧默认 `任务 / 能力演进`，第二标签 `当前能力基线`。
1320. Maintenance notes（提示词保留窗口已执行清理）：
   - 按 `docs/workflow/prompts/` 保留最近 7 轮的治理口径，本轮已删除较早的 `docs/workflow/prompts/执行提示词-训练中心创建角色链路修正开工-20260324.md`。
1321. Maintenance notes（偏好归属结论）：
   - 本轮仍未新增超出当前主题的新长期偏好。
   - 推断/假设（中）：用户当前已接受“先本地收口原型与执行提示词，再交给 ../workflow 开工”的节奏，这与既有跨工作区分发顺序偏好一致，先记流水，不单独升格为新长期偏好。
1322. Maintenance notes（训练优化原型路径已修正）：
   - 用户指出原型文件落位错误，本轮已将临时路径 `docs/workflow/prototypes/role-opt.html` 移动为正式路径 `docs/workflow/prototypes/角色中心与训练优化工作流/训练优化参考图.html`。
   - 已同步修正以下引用：
     1. `docs/workflow/requirements/需求详情-角色中心与训练优化工作流.md`
     2. `docs/workflow/prompts/执行提示词-角色中心训练优化能力列表与门禁绑定开工-20260329.md`
1323. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户对原型资产的目录落位与交付规范高度敏感，要求正式文件避免使用临时短路径；该要求与既有“文档治理与跨工作区一致性”偏好一致，先记流水，不单独升格。
1324. Maintenance notes（角色中心训练优化交付文件已同步到 ../workflow）：
   - 本轮已将以下文件同步到 `../workflow/docs/workflow/`：
     1. `prototypes/角色中心与训练优化工作流/训练优化参考图.html`
     2. `requirements/需求详情-角色中心与训练优化工作流.md`
     3. `prompts/执行提示词-角色中心训练优化能力列表与门禁绑定开工-20260329.md`
   - 目标侧路径已逐一校验存在。
1325. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前仍坚持“先在 Analyst 本地收口，再同步到 ../workflow 开工”的分发节奏；该偏好与既有跨工作区分发顺序一致，先记流水，不单独升格。
1326. Maintenance notes（上一轮对 ../workflow 开工需求回溯）：
   - 已回溯 `.codex` 日记忆、需求文档与执行提示词，确认最近一次明确“可直接让 ../workflow 开工”的记录为 `2026-03-29 10:09:41 +08:00`。
   - 对应主题为 `角色中心 -> 训练优化`，重点实现口径包括：中部聊天壳内的能力列表主视图、每项能力同时展示效果证据与评分、`Gate-B / Gate-C` 绑定到具体能力项、右侧默认 `任务 / 能力演进`。
1327. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前主要是在恢复跨工作区交接上下文，属于场景性回溯查询，不升格为长期偏好。
1328. Maintenance notes（8090 live 验收：角色中心与训练优化）：
   - 已对 `http://127.0.0.1:8090` 做 live 只读验收，证据落在 `.tmp/acceptance-live-8090/`。
   - 当前运行态显示：
     1. 页面主标题仍为“训练中心”；
     2. 子模块仍为“角色资产与版本 / 创建角色 / 训练闭环”；
     3. `训练闭环` 默认是三步表单式创建（`基础信息 / 首轮工作集 / 启动确认`）；
     4. 未出现“训练优化会话 / 本轮能力列表 / 能力展示效果 / 能力评分 / 任务 / 能力演进 / 当前能力基线”这些最新需求要求的主视图元素；
     5. live 队列当前为空，`/api/training/queue?include_removed=1&include_test_data=0` 返回 `items=[]`。
1329. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前更关心“直接基于 live 运行态判断最新需求是否真正上线”，这属于当前验收主题下的任务目标，不升格为长期偏好。
1330. Maintenance notes（基于 8090 live 验收结果生成修正提示词）：
   - 已新增提示词：`docs/workflow/prompts/执行提示词-角色中心训练优化live验收失败修正开工-20260330.md`。
   - 提示词已明确要求执行工作区修正以下 live 已证实偏差：
     1. `训练中心` 未收口为 `角色中心`；
     2. 子模块仍为 `训练闭环`；
     3. 默认主路径仍是 `基础信息 / 首轮工作集 / 启动确认` 三步表单；
     4. 空态下缺少中部聊天壳、能力列表区、右侧 `任务 / 能力演进` 与 `当前能力基线` 双标签。
1331. Maintenance notes（提示词目录治理）：
   - 已执行 `scripts/trim-workflow-prompts.ps1`，按“最近 7 轮”规则删除最旧提示词：
     `docs/workflow/prompts/执行提示词-需求与缺陷模块排序与顺序建单开工-20260325.md`。
1332. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前要的是“可直接转发、直接催执行”的交接提示词，而不是再看一轮需求分析展开；该结论属于当前任务目标，不升格为长期偏好。
1333. Maintenance notes（工作区超大文件检查）：
   - 已按文件体积扫描当前工作区，采用 `>5MB` 作为“超大文件”临时阈值。
   - 当前命中的文件全部位于 `.tmp/edge-profile-8090/` 下，属于浏览器运行缓存/组件缓存，不是需求文档、脚本或知识资产主文件。
   - 当前未发现 `docs/`、`workspace_state/`、`user_profile/`、`knowledge_base/` 下存在 `>5MB` 的主文件。
1334. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前是在做工作区健康检查，属于一次性排查任务，不升格为长期偏好。
1335. Maintenance notes（图示建模技能盘点）：
   - 已检索 `.codex/skills/`、`skills/`、`workspace_state/`、`knowledge_base/`、`docs/` 中与 `4+1 / 流程图 / 时序图 / 类图 / Mermaid / PlantUML / UML` 相关内容。
   - 当前确认：本地没有专门用于 `4+1 视图 / 流程图 / 时序图 / 类图` 产出的现成技能。
   - 现有最接近的可复用能力为：
     1. `method-selection-orchestrator`：先判断该画哪类图；
     2. `requirement-convergence-gate`：先收敛边界，再出图；
     3. `subrole-invocation-orchestrator`：做多视角审查与分工外化；
     4. `proactive-practice-advisor`：补检查清单与更优交付方式。
   - 若后续需要高复用出图能力，建议新增专门 skill，统一产出 Mermaid/PlantUML 的模板、检查清单与需求追溯格式。
1336. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前要的是“可复用的建模/图示技能能力”，而不是一次性图稿；该结论暂记流水，不升格为长期偏好。
1337. Maintenance notes（在线图示技能检索）：
   - 已联网检索 OpenAI 官方、AgentSkills、MCP Market、GitHub 等来源，确认 Codex/ChatGPT 已支持 Skills，且遵循 Agent Skills 开放标准。
   - 已找到多类与 `4+1 视图 / 流程图 / 时序图 / 类图` 相关的社区技能，主要分布为：
     1. Mermaid 生成类：`mermaid-diagram-generator`、`mermaidjs-v11`、`mermaid-diagram-specialist`；
     2. UML / draw.io 类：`uml`；
     3. 架构多视图 / C4 类：`architecture-diagrams`、`c4-architecture`、`Diagrams Architect`、`C4 Diagram skill using D2`；
     4. 自动扫描代码库出图类：`oh-my-mermaid`；
     5. Mermaid 预览/导出类：`claude-mermaid`（内置 `mermaid-diagrams` skill）。
   - 检索结果显示：未找到明确以 `4+1 view` 命名、且成熟度较高的现成技能；当前最接近的是 `C4`/架构多视图类技能。
1338. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前不只是想知道“本地有没有”，而是想判断“外部有没有现成可借用的图示 skill 生态”，该结论先记流水，不升格为长期偏好。
1339. Maintenance notes（社区图示 skill 已下载到临时目录）：
   - 已将图示相关社区 skill 下载到 `.tmp/model_skill/`，未执行安装。
   - 已整理出的可直接查看 skill 子目录包括：
     1. `patricio-mermaid-diagram-generator`
     2. `softaworks-mermaid-diagrams`
     3. `softaworks-c4-architecture`
     4. `softaworks-draw-io`
     5. `aj-geddes-architecture-diagrams`
     6. `oh-my-mermaid-omm-scan`
     7. `oh-my-mermaid-omm-view`
     8. `oh-my-mermaid-omm-push`
     9. `veelenga-mermaid-diagrams`
   - 来源仓库与用途已写入 `.tmp/model_skill/README.md`。
   - 另有 `aaaaqwq-claude-code-skills` 仓库拉取超时，仅留下 `.git` 骨架，未纳入已选 skill 目录。
1340. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前更看重“先把外部可用 skill 资产抓下来备查”，属于当前任务执行偏好，不升格为长期偏好。
1341. Maintenance notes（Codex失败原因与重试治理排查）：
   - 已完成 `../workflow` 中真实 `Codex` 请求链路首轮排查，确认当前至少包含 5 条链路：
     1. 策略提取 / `AGENTS.md` 分析；
     2. 会话任务执行中心；
     3. 创建角色分析对话；
     4. 发布评审 / 确认发布兜底；
     5. 任务中心真实执行。
   - 已在 Analyst 工作区新增整改文档：
     1. `docs/workflow/reports/排查报告-Codex调用失败原因与重试现状-20260330.md`
     2. `docs/workflow/requirements/需求详情-统一Codex失败原因展示与重试治理.md`
   - 已更新 `docs/workflow/overview/需求概述.md`，将本轮“统一 Codex 失败合同 + 显式重试动作 + 证据入口 + 尝试次数”收入口径。
1342. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户面对不稳定的 `Codex` 功能链路时，明确偏好“失败原因可见 + 可直接重试”，不接受只有泛化错误提示或隐式自动重试；该结论与既有“留痕、失败复盘、链路可下钻”偏好一致，但当前仍先记流水，不升格为长期偏好。
1343. Maintenance notes（Codex失败治理文档已同步到 ../workflow）：
   - 已将以下文件同步到 `../workflow/docs/workflow/`：
     1. `overview/需求概述.md`
     2. `requirements/需求详情-统一Codex失败原因展示与重试治理.md`
     3. `reports/排查报告-Codex调用失败原因与重试现状-20260330.md`
     4. `prompts/执行提示词-统一Codex失败原因展示与重试治理开工-20260330.md`
   - 已对上述 4 个文件完成双端 `SHA256` 校验，当前 Analyst 与 `../workflow` 内容一致。
   - 已按“最近 7 轮”规则裁剪 prompt：
     1. Analyst 删除 `执行提示词-需求与缺陷模块优先级真相源与重复建单修正开工-20260326.md`
     2. `../workflow` 删除 `执行提示词-需求与缺陷模块排序与顺序建单开工-20260325.md`
     3. `../workflow` 删除 `执行提示词-训练中心创建角色链路修正开工-20260324.md`
1344. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前更看重“文档先同步到执行工作区，再拿到一句可直接转发的开工口令”，该结论与既有分发顺序偏好一致，先记流水，不单独升格。
1345. Maintenance notes（补齐未同步的执行提示词）：
   - 已复核 Analyst 与 `../workflow` 两侧 `docs/workflow/prompts/` 差异。
   - 发现此前确有 1 条提示词未同步到 `../workflow`：
     1. `docs/workflow/prompts/执行提示词-角色中心训练优化live验收失败修正开工-20260330.md`
   - 已完成补同步，并对该文件做双端 `SHA256` 校验一致。
   - 同步后已在 `../workflow` 侧再次执行最近 7 轮裁剪，删除旧文件：
     `docs/workflow/prompts/执行提示词-需求与缺陷模块优先级真相源与重复建单修正开工-20260326.md`
1346. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户对跨工作区交付的要求不仅是“给出提示词”，还包括“确保过去的重要提示词没有漏同步”；该结论与既有文档一致性偏好一致，先记流水，不升格为长期偏好。
1347. Maintenance notes（8090 角色中心二次 live 验收）：
   - 已于 2026-03-30 13:09~13:11 +08:00 再次只读验收 `http://127.0.0.1:8090` 当前 `角色中心 -> 训练优化`。
   - 结论：命名与一级导航已基本收口，但训练优化主工作台仍未满足最新要求。
   - 当前主要偏差集中在：
     1. 中部仍偏“收集目标/补字段/存草稿”的表单化工作台，而不是“本轮能力列表”为默认主视图；
     2. 能力对象未完整展示“效果证据 + 评分 + Gate-B/Gate-C + 历史能力影响”；
     3. 右侧未清晰体现 `任务 / 能力演进` 与 `当前能力基线` 双标签结构；
     4. 在 `queue=0` 空态下，新信息架构仍不够完整。
1348. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前对验收结论的核心要求是“以当前 live 真相为准，明确区分已通过项与剩余失败项”，不接受继续沿用过期截图或旧命名结论；该判断当前主要来自本轮任务语境，先记流水，不升格为长期偏好。
1349. Maintenance notes（新增并同步二次整改提示词）：
   - 已新增提示词：
     `docs/workflow/prompts/执行提示词-角色中心训练优化二次live验收继续整改开工-20260330.md`
   - 已同步到：
     `../workflow/docs/workflow/prompts/执行提示词-角色中心训练优化二次live验收继续整改开工-20260330.md`
   - 已完成双端 `SHA256` 校验一致：
     `401DC35E890C1E25AE73F248636FA3B5BCB6E3BC85263B888A968ACCCDDE047C`
   - 已按“最近 7 轮”规则在两侧裁剪最旧提示词：
     `执行提示词-需求与缺陷模块标题栏总开关与连续解决缺陷开工-20260327.md`
1350. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前不仅要新提示词本身，还要求同步动作、保留窗口与一致性校验同时完成；该结论与既有跨工作区分发治理偏好一致，先记流水，不升格为长期偏好。
1351. Maintenance notes（8090 角色中心再验收）：
   - 已于 2026-03-30 20:23~20:32 +08:00 再次只读验收 `http://127.0.0.1:8090` 的 `角色中心 -> 训练优化`。
   - 本轮 fresh browser session 下，live 已显示：
     1. `角色中心`
     2. `角色资产与版本 / 创建角色 / 训练优化`
     3. `训练优化` 空态工作台
     4. 右侧 `任务 / 能力演进` 与 `当前能力基线` 双标签
   - 但当前仍未能以 live 证据证明“真实能力对象卡”已经打通；页面里仍主要是空态说明与收敛提示，未出现带 `效果 + 评分 + Gate-B/Gate-C + 历史影响` 的实际能力项卡片。
   - 右下角 `工作区升级` 浮层仍然覆盖主工作台一部分区域，首屏可读性问题仍在。
   - 另发现：一个已打开的旧浏览器会话在刷新前曾停留在旧结构；刷新后恢复为新结构，说明上线后可能仍存在会话级缓存/热更新可见性风险。
1352. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前要求的不只是“再看一次”，而是要确认“当前 live 是否真实推进、是否还存在回退或会话级假通过”；该判断当前主要来自本轮验收语境，先记流水，不升格为长期偏好。
1353. Maintenance notes（新增并同步角色中心训练优化剩余问题专项整改提示词）：
   - 已新增提示词：
     `docs/workflow/prompts/执行提示词-角色中心训练优化剩余问题专项整改开工-20260330.md`
   - 本轮提示词只收口两类剩余 blocker：
     1. live 中必须出现至少 1 条真实能力项卡，并同时展示 `效果 + 评分 + Gate-B/Gate-C + 历史影响`
     2. `工作区升级` 浮层不再遮挡训练优化主工作台
   - 已同步到：
     `../workflow/docs/workflow/prompts/执行提示词-角色中心训练优化剩余问题专项整改开工-20260330.md`
   - 已完成双端 `SHA256` 校验一致：
     `5EE4BD537101B0EC42A9F034ED2406150FAB65A0FC31322985D74AB7294D582C`
   - 已按“最近 7 轮”规则在两侧裁剪最旧提示词：
     `执行提示词-创建workflow_tester角色并验证创建链路-20260327.md`
1354. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（低）：用户当前更需要“只盯剩余 blocker 的专项提示词”，而不是继续分发大而全的整改包；该判断当前主要来自本轮验收后续动作，先记流水，不升格为长期偏好。
## 2026-03-31

1355. Maintenance notes（8090 创建角色链路验证“图示建模能力包型 agent”）：
   - 已于 2026-03-31 09:41~09:49 +08:00 实测 `http://127.0.0.1:8090` 的 `角色中心 -> 创建角色 -> 新建` 链路，并用两轮高密度输入验证“任务分解 + 知识沉淀”诉求。
   - 实测结果显示：当前创建对话的 `Analyst` 已能在聊天层面按“能力模块、知识文件/示例文件、关键缺口问题”回应，不再只做一句话人设压缩。
   - 但底层结构仍以“六要素角色画像”收口为主：
     1. `角色画像` 页仍按 `角色名 / 角色目标 / 核心能力 / 边界 / 协作方式 / 适用场景` 做字段映射；
     2. 复杂约束被挤压进错误字段，例如适用场景与默认交付策略被混入 `协作方式`，格式边界被混入 `边界`；
     3. 下方 `训练优化` 区仍是 `能力对象 0 项` 的空壳，未根据当前收口结果自动生成真实能力卡或知识沉淀任务。
   - 结论：`8090` 当前只能“部分实现”用户想要的效果，即前台分析对话已能表达能力包思路，但还不能稳定把该思路落成结构化能力对象与知识沉淀任务。
   - 证据截图已保存在：
     1. `.tmp/create-role-after-wait-20260331-live.png`
     2. `.tmp/create-role-second-reply-20260331-live.png`
     3. `.tmp/create-role-profile-final-20260331-live.png`
1356. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前验证 `8090` 创建角色能力时，核心验收标准不是“能否写出更像样的人设描述”，而是“是否能在创建阶段把任务分解与知识沉淀真正落成可执行结构”；该判断有本轮明确原话支撑，但仍先记流水，不升格为长期偏好。
1357. Maintenance notes（新增并同步创建角色能力包驱动整改需求）：
   - 已新增需求详情：
     `docs/workflow/requirements/需求详情-创建角色能力包驱动与知识沉淀任务化.md`
   - 已新增执行提示词：
     `docs/workflow/prompts/执行提示词-创建角色能力包驱动与知识沉淀任务化开工-20260331.md`
   - 已更新概述索引：
     `docs/workflow/overview/需求概述.md`
   - 本轮整改范围不只包含“能力包真相源 / 知识沉淀真相源 / 首批任务化”，也把 live 实测中的体验差点一并收口：
     1. 新建草稿后输入激活状态不清晰；
     2. 分析执行中长期只显示 `分析中...`；
     3. “草稿已齐”与“能力对象 0 项”并存的前后信号冲突；
     4. `创建角色` 页面混入无关 `训练优化` 空壳；
     5. 用户看不到“角色画像 / 能力包 / 知识沉淀 / 首批任务”的结构化差异。
   - 已同步到 `../workflow/docs/workflow/`，并完成双端 `SHA256` 校验一致：
     1. `requirements/需求详情-创建角色能力包驱动与知识沉淀任务化.md`
        `77EC59DA6C43C2AF183170F61111A6CCDE88BF3C129881BC7F47B1902EA28BA8`
     2. `prompts/执行提示词-创建角色能力包驱动与知识沉淀任务化开工-20260331.md`
        `F16AB68CBF2A2D17097AC7206FE9E4D0F56DC13F6E17321FDCA24496EF4E0819`
     3. `overview/需求概述.md`
        `4B8C8208DF0BCD764D99CC2EA1D21EEA03291C347718010CC3B498CA438FCD47`
   - 已按“最近 7 轮”规则，在两侧删除最旧提示词：
     `执行提示词-任务中心全局唯一任务图同步检查-20260328.md`
1358. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前对 `workflow` 创建角色能力的真实要求，已经从“能否把角色画像聊完整”升级为“是否能在创建阶段直接产出能力包、知识沉淀与首批任务，并同时保证交互体验不糟糕”；该判断与本轮新增需求及用户补充语句一致，但仍先记流水，不升格为长期偏好。
1359. Maintenance notes（8090 训练优化界面铺满问题复核）：
   - 已于 2026-03-31 10:08~10:16 +08:00 复核 `http://127.0.0.1:8090` 当前 live `角色中心 -> 训练优化` 界面，版本号为 `20260331-203853`。
   - 结论：当前问题不只是“训练优化没铺满屏幕”，而是更上层的模块显示/滚动链路异常：
     1. 在 `角色资产与版本` 处于激活态时，`#tcModuleOps` 仍被计算为 `display:grid`，而不是隐藏；
     2. 因此 `训练优化` 整块会被直接挂在 `角色资产与版本` 页面下方一起渲染，导致应用高度被拉到数千像素；
     3. active 进入 `训练优化` 后，应用根容器高度仍远大于视口高度，页面更像长文档滚动，而不是固定单窗口工作台。
   - live 取证数据：
     1. `tcModuleOps.className = "tc-module"` 但 `getComputedStyle(...).display = "grid"`；
     2. 资产页状态下 `appRoot` 高度约 `4632px`，训练优化 active 态下仍约 `3442px`；
     3. active 态时 `bodyScrollTop ≈ 2738`、`appRoot.top ≈ -2738`，说明页面已被拉成长页并发生 body 级滚动。
   - 代码根因已定位到样式优先级冲突：
     1. `index.html` 中 `#tcModuleOps` 本应是普通 `tc-module`，由 active class 决定显示；
     2. 但 `index_release_review.css` 中 `#tcModuleOps { display: grid; ... }` 覆盖了通用隐藏规则；
     3. 后续 `index_training_loop_overview.css` 又为 `#tcModuleOps .tc-loop-grid` 注入完整三栏布局，进一步放大该问题。
   - 次级结论：
     1. 当前调试窗口视口仅约 `754x487`，已命中 `@media (max-width: 980px)` 的单栏响应式断点；
     2. 这会让训练优化在小窗口下天然退化为单栏，但这不是本轮“整页不铺满 / 长页滚动”的主因。
   - 当前验收截图：
     1. `.tmp/training-opt-assets-20260331.png`
     2. `.tmp/training-opt-live-20260331-b.png`
1360. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前对“训练优化是否铺满屏幕”的真实关注点，不是单纯要更宽，而是要它恢复为固定单工作台、首屏稳定、模块切换时不叠成长文档；该判断由本轮 live 证据与用户“改了好几轮都失败”表述共同支撑，但仍先记流水，不升格为长期偏好。
## 2026-04-01

1361. Maintenance notes（新增并同步训练优化单窗口铺满专项整改提示词）：
   - 已新增提示词：
     `docs/workflow/prompts/执行提示词-训练优化单窗口铺满与模块隐藏链路修正开工-20260401.md`
   - 已同步到：
     `../workflow/docs/workflow/prompts/执行提示词-训练优化单窗口铺满与模块隐藏链路修正开工-20260401.md`
   - 已完成双端 `SHA256` 校验一致：
     `FE88F5D3A48C6E82648A56ADCF6EB878D50D0AB702B54054A458271718CAA8D8`
   - 已按“最近 7 轮”规则，在两侧删除最旧提示词：
     `执行提示词-缺陷处理任务命名可指定开工-20260328.md`
1362. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前要的不只是“再给一份提示词”，而是要求这份提示词已经同步到 `../workflow`、可直接开工、且提示词目录仍受最近 7 轮治理；该判断与用户多轮分发口径及本轮动作一致，但仍先记流水，不升格为长期偏好。
1363. Maintenance notes（.codex 月摘要可读性修正）：
   - 已更新 `scripts/maintain-codex-memory.ps1` 的全局月摘要生成逻辑，并重建：
     1. `.codex/memory/全局记忆总览.md`
     2. `.codex/memory/2026-02/记忆总览.md`
     3. `.codex/memory/2026-03/记忆总览.md`
   - 当前 `### 每月摘要` 已改为直接描述：
     1. `本月主线`
     2. `重点模块`
     3. `主要产出`
   - 不再直接拼接月内前几条零散回合主题。
1364. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前对工作记忆摘要的要求，是“先能一眼看懂这个月到底做了什么”，而不是保留更机械的流水拼接摘要；该判断由本轮明确反馈直接支撑，但仍先记流水，不升格为长期偏好。
1365. Maintenance notes（.codex 每日摘要可读性修正）：
   - 已继续更新 `scripts/maintain-codex-memory.ps1`，并重建：
     1. `.codex/memory/2026-02/记忆总览.md`
     2. `.codex/memory/2026-03/记忆总览.md`
     3. `.codex/memory/全局记忆总览.md`
   - 当前 `YYYY-MM/记忆总览.md` 中的 `### 每日摘要` 已改为直接描述：
     1. `当天主线`
     2. `涉及模块`
     3. `主要产出`
     4. `结果`
   - 不再继续堆叠当天的零散主题、决策与待跟进。
1366. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前对记忆回看体验的要求，是月级和日级摘要都要先解决“看懂做了什么”，而不是保留过程流水的原始密度；该判断由本轮连续反馈直接支撑，但仍先记流水，不升格为长期偏好。

## 2026-04-02
1367. Maintenance notes（并发能力判断口径澄清）：
   - 用户本轮明确澄清：问题不是 `workflow` 产品是否支持多个会话/任务并发推进，而是 `../workflow` 这一个 agent 工作区，是否支持两个 agent 同时修改同一目录并安全开发。
   - 已按该口径完成排查，重点核对：
     1. 共享状态与记忆文件写入目标；
     2. 工作区/agent 级并发锁或写回门禁；
     3. 发布与角色创建链路是否存在直接文件写入或 Git 变更且缺少工作区级保护。
1368. Maintenance notes（偏好归属结论）：
   - 本轮未新增长期偏好。
   - 推断/假设（中）：用户当前不仅要求“能并发”，更要求先把“任务并发”与“同工作区安全协作”这两个概念严格区分，再基于真实落地的锁、门禁和写入语义下结论；该判断与本轮连续纠偏直接一致，但仍先记流水，不升格为长期偏好。
1369. New observations（用户明示）：
   - 用户本轮提出新的架构判断方向：若要让多个 agent 真正同时工作，应将 `../workflow` 中“agent 相关运行态”和“业务代码仓”分离，不再把两者混放在同一工作区目录中。
1370. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 用户当前对并发开发能力的真实要求，已经从“加锁避免冲突”进一步升级为“从架构上拆开 agent 运行态与业务代码，降低共享目录天然冲突面”；该判断与本轮用户新表述一致，但仍先记流水，不升格为长期偏好主档。
1371. New observations（用户明示）：
   - 用户本轮进一步提出具体拆分口径：可以把 `workflow_code` 单独抽出，原先的 `../workflow` 保留为 PM/编排工作区，并新增 `../workflow_coder1/2/3` 与 `tester1/2/3` 等 agent 角色工作区。
1372. Changed confidence or behavior（推断/假设，置信度: 中）：
   - 用户当前对整改方案的偏好，已经从“补并发锁”转向“通过角色拆分 + 代码主仓独立 + PM 工作区保留”的重构式解法；这说明用户接受为长期并发能力付出一定结构调整成本，但仍要求先把步骤讲清楚再开工。
