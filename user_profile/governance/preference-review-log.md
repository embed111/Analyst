# 长期偏好评审日志

## 规则
1. 触发条件：任一长期偏好文件超过 200 行。
2. 评审动作：
   1. 保留跨话题稳定偏好在长期主档；
   2. 将阶段性/主题性条目降级到短期偏好池。
3. 结果记录：
   1. 记录触发文件、评审结论、迁移文件、迁移原因。

## 2026-03-03 首次评审
1. 触发文件：
   1. `user_profile/core/thinking-patterns-domain-requirements.md`（276 行，超限）。
2. 评审结论：
   1. 保留“场景特征/决策偏好/对应执行策略/待验证问题”等长期稳定主干。
   2. 将四个增量专题块降级到短期偏好池。
3. 降级去向：
   1. `user_profile/core/thinking-patterns-short-term.md`（A/B/C/D 四个专题块）。
4. 评审后状态：
   1. `thinking-patterns-domain-requirements.md` 降至 200 行内。
5. 备注：
   1. 后续若短期条目跨 2 个独立话题复现，可按规则回升到长期主档。

## 2026-03-14 协作域超限复核
1. 触发文件：
   1. `user_profile/core/thinking-patterns-domain-collaboration.md`（201 行，超限）。
2. 评审结论：
   1. 该次超限由重复的 `最后更新` 元数据行造成，不属于新增稳定偏好堆积。
   2. 长期偏好正文暂不降级，先移除重复元数据并恢复到上限内。
3. 降级去向：
   1. 无。
4. 评审后状态：
   1. `thinking-patterns-domain-collaboration.md` 已回到 200 行内。
5. 备注：
   1. 后续若协作域再次超限，优先降级阶段性提示词治理和单主题交付细则到短期偏好池。

## 2026-03-18 协作域超限评审
1. 触发文件：
   1. `user_profile/core/thinking-patterns-domain-collaboration.md`（203 行，超限）。
2. 评审结论：
   1. 本次超限由协作域尾部的元观察与待验证项造成，未新增必须常驻长期主档的稳定偏好。
   2. 长期主档仅保留已跨话题复现、会直接驱动默认协作策略的条目。
3. 降级去向：
   1. `user_profile/core/thinking-patterns-short-term.md`：
      - “变化信号候选”2 条；
      - “短周期、多迭代”待验证观察 1 条。
4. 评审后状态：
   1. `thinking-patterns-domain-collaboration.md` 已回到 200 行内。
5. 备注：
   1. 若上述候选在后续跨 2 个独立话题复现，再按规则回升到长期主档。

