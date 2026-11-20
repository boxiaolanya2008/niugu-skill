# 提交信息模板 — 复制到 commit message（正文写"为什么"，diff 已说明"改了什么"）

```
<类型>(<范围>): <祈使句摘要，≤50 字，不加句号>

<正文：为什么改。决策理由、取舍、影响面。每行 ≤72 字。没有就省略正文。>

<BREAKING CHANGE: <迁移说明>            ← 仅有破坏性变更时
 Closes #<issue号>                      ← 关联 issue 时
 Refs #<issue号>>
```

类型速查：
| 类型 | 用途 |
| --- | --- |
| feat | 新功能 |
| fix | 缺陷修复 |
| refactor | 重构（不改行为） |
| docs | 纯文档 |
| test | 测试 |
| chore | 构建/依赖/杂项 |
| perf | 性能优化 |
| build / ci | 构建系统 / CI 配置 |

反例 → 正例：
- `修复了bug` → `fix(invoice): 税率越界时抛出 RangeError 而非静默返回 0`
- `更新代码` → `refactor(split-invoice): 拆分 calcTotal 为纯函数与副作用两段`
