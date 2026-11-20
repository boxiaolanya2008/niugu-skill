# WORKLOG — niugu-skill 构建

## 已定决策

- 2026-11-20 v2 重构决策：单合集拆为 5 个独立 skill（orchestration / style-reset / interface / svg-graphics / docs），每个 skill 独立 feat/* 分支交付后合入 master
- 2026-11-20 PROMPT.md 定位为总控枢纽：读完 Prompt 后强制立即读取全部 5 个 skill 文件，缺失报错禁止臆造
- 2026-11-20 保留交付形态：Skill 目录格式 + 独立 Prompt 版两者兼有；风格规范完全自包含

## 已验证结论

- 工作区初始为空目录，全部文件为新建，无覆盖风险
- v1 五文件全部落盘；assets/architecture.svg 通过 .NET XML 解析（well-formed）
- 2026-11-20 SKILL.md frontmatter（name: niugu-skill）校验通过
- 2026-11-20 {{variable_name}} 在 SKILL.md / PROMPT.md / README.md 中均逐字保留
- 2026-11-20 全库无 Mermaid 代码块（首次校验的 7 次命中均为"禁止 Mermaid"禁令文字，属误报，已修正口径复测为 0）
- 2026-11-20 v2 分支策略执行确认：「先建分支再写文件」顺序可避免未跟踪文件串扰

## 踩坑清单

- PowerShell 校验"Mermaid 出现"时口径过宽：凡含关键词即命中，会把禁令文字误判为违规。校验应匹配代码块签名（```mermaid / graph TD / flowchart），而非裸关键词。
