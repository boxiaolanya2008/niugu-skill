# WORKLOG — niugu-skill 构建

## 已定决策

- 2026-11-20 交付形态：Skill 目录格式 + 独立 Prompt 版两者兼有
- 2026-11-20 组织粒度：单 skill 合集（一个 SKILL.md 承载全部规范）
- 2026-11-20 风格基线：完全自包含，不依赖 warm-frontend / code-discipline 等现有 skill
- 2026-11-20 图形规范：架构图/流程图一律 SVG，禁止 Mermaid
- 2026-11-20 视觉基线：暖色克制，色相 ≤3（米白底 #faf7f2 / 暖墨 #2d2a26 / 暖橙 #c96f2e）

## 已验证结论

- 工作区初始为空目录，全部文件为新建，无覆盖风险
- 2026-11-20 五文件全部落盘；assets/architecture.svg 通过 .NET XML 解析（well-formed）
- 2026-11-20 SKILL.md frontmatter（name: niugu-skill）校验通过
- 2026-11-20 {{variable_name}} 在 SKILL.md / PROMPT.md / README.md 中均逐字保留
- 2026-11-20 全库无 Mermaid 代码块（首次校验的 7 次命中均为"禁止 Mermaid"禁令文字，属误报，已修正口径复测为 0）

## 踩坑清单

- PowerShell 校验"Mermaid 出现"时口径过宽：凡含关键词即命中，会把禁令文字误判为违规。校验应匹配代码块签名（```mermaid / graph TD / flowchart），而非裸关键词。
