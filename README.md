# niugu-skill

反惯性的 LLM 全栈开发 skill 体系：10 个独立 skill + 可执行工具链，覆盖**思考 → 编排 → 编码 → Git → 视觉 → 文档**全链路，系统性覆盖模型默认训练习惯，编程与记忆为核心底座。

## 快速开始

**方式一：Claude / OpenCode 宿主（自动激活）**

```bash
git clone <仓库地址> ~/.claude/skills/niugu-skill
# 各 skills/*/SKILL.md 的 frontmatter 激活关键词命中即自动加载，无需手动操作
```

**方式二：任意平台（粘贴即用）**

将 [`PROMPT.md`](PROMPT.md) 全文作为系统提示或会话开场指令——其【强制第一步】要求读完 Prompt 后立即读取全部 10 个 skill 文件。

**方式三：验证安装**

```bash
pwsh scripts/verify.ps1          # 交付门禁：全 PASS 退出码 0
pwsh scripts/new-skill.ps1 demo  # 脚手架：一条命令产出新 skill 骨架
```

## 结构说明

| 路径 | 职责 |
| --- | --- |
| `PROMPT.md` | 总控枢纽：强制第一步读取全部 skill + 场景映射 + 13 条速览 |
| `skills/orchestration/` | Spec-Plan-Write-Test-Push 五阶段闭环、门禁 G1–G4、三次熔断 |
| `skills/thinking-style/` | 思考五步流、先读后写、bug 假设验证、记忆三问 |
| `skills/memory-discipline/` | 三层记忆、WORKLOG 检查点、会话恢复先读后开口 |
| `skills/reply-style/` | 结论先行、信息密度、禁 AI 腔、6 场景回复差异表 |
| `skills/style-reset/` | 反惯性编码：红线表、领域命名、坏味道对照 |
| `skills/code-standard/` | 编码规范与四类注释规范、语言细则速查 |
| `skills/git-workflow/` | 原子提交、分支策略、merge/rebase 决策、应急找回 |
| `skills/interface/` | 界面纪律：色相 ≤3、间距刻度、squircle 图标、Hero 规范 |
| `skills/svg-graphics/` | SVG 架构图/流程图规范（禁止 Mermaid） |
| `skills/docs/` | README 五段结构、信息密度、变更记录写为什么 |
| `scripts/` | verify.ps1 交付门禁 / commit-gate.ps1 提交拦截 / new-skill.ps1 脚手架 |
| `templates/` | 规划卡 / 提交信息 / PR 描述 / gitignore 四件套 |

<svg viewBox="0 0 880 560" xmlns="http://www.w3.org/2000/svg" font-family="'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif">
  <defs>
    <marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="#c96f2e"/>
    </marker>
  </defs>
  <rect x="0" y="0" width="880" height="560" fill="#faf7f2"/>
  <text x="440" y="42" text-anchor="middle" font-size="22" font-weight="700" fill="#2d2a26">niugu-skill 体系架构：Prompt 枢纽驱动多 skill</text>
  <text x="440" y="64" text-anchor="middle" font-size="12" fill="#8a8378">读完 Prompt 强制读取全部 skill 文件 → 按场景主动调用（思考/回复/记忆为全领域底座）</text>
  <rect x="240" y="88" width="400" height="72" fill="#f7e3cf" stroke="#c96f2e" stroke-width="2" rx="10"/>
  <text x="440" y="118" text-anchor="middle" font-size="16" font-weight="700" fill="#2d2a26">PROMPT.md 总控枢纽</text>
  <text x="440" y="142" text-anchor="middle" font-size="11" fill="#8a8378">强制第一步：读取下述 10 个 skill 文件</text>
  <line x1="440" y1="160" x2="440" y2="192" stroke="#c96f2e" stroke-width="2" marker-end="url(#arrow)"/>
  <text x="440" y="182" text-anchor="middle" font-size="10" fill="#c96f2e">读取后立即加载</text>
  <rect x="36" y="200" width="808" height="164" fill="#ffffff" stroke="#d8cfbe" stroke-width="1" rx="10"/>
  <text x="52" y="222" font-size="11" font-weight="700" fill="#8a8378">流程与工程</text>
  <rect x="46" y="232" width="150" height="114" fill="#faf7f2" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="121" y="258" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">orchestration</text>
  <text x="121" y="280" text-anchor="middle" font-size="10" fill="#8a8378">五阶段闭环 · 门禁 G1–G4</text>
  <text x="121" y="298" text-anchor="middle" font-size="10" fill="#8a8378">三次熔断</text>
  <text x="121" y="330" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/orchestration</text>
  <rect x="210" y="232" width="150" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="285" y="258" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">style-reset</text>
  <text x="285" y="280" text-anchor="middle" font-size="10" fill="#8a8378">反惯性红线 · 领域命名</text>
  <text x="285" y="298" text-anchor="middle" font-size="10" fill="#8a8378">坏味道对照</text>
  <text x="285" y="330" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/style-reset</text>
  <rect x="374" y="232" width="150" height="114" fill="#faf7f2" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="449" y="258" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">code-standard</text>
  <text x="449" y="280" text-anchor="middle" font-size="10" fill="#8a8378">组织格式 · 错误处理</text>
  <text x="449" y="298" text-anchor="middle" font-size="10" fill="#8a8378">四类注释规范</text>
  <text x="449" y="330" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/code-standard</text>
  <rect x="538" y="232" width="150" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="613" y="258" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">git-workflow</text>
  <text x="613" y="280" text-anchor="middle" font-size="10" fill="#8a8378">原子提交 · 分支策略</text>
  <text x="613" y="298" text-anchor="middle" font-size="10" fill="#8a8378">revert / reflog 应急</text>
  <text x="613" y="330" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/git-skill</text>
  <rect x="702" y="232" width="140" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="772" y="258" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">interface</text>
  <text x="772" y="280" text-anchor="middle" font-size="10" fill="#8a8378">界面纪律 · 色相 ≤3</text>
  <text x="772" y="298" text-anchor="middle" font-size="10" fill="#8a8378">图标 · Hero</text>
  <text x="772" y="330" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/interface</text>
  <rect x="36" y="376" width="808" height="164" fill="#ffffff" stroke="#d8cfbe" stroke-width="1" rx="10"/>
  <text x="52" y="398" font-size="11" font-weight="700" fill="#8a8378">视觉文档与心智底座（全领域生效）</text>
  <rect x="46" y="408" width="150" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="121" y="434" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">svg-graphics</text>
  <text x="121" y="456" text-anchor="middle" font-size="10" fill="#8a8378">SVG 图形 · 配色令牌</text>
  <text x="121" y="474" text-anchor="middle" font-size="10" fill="#8a8378">禁止 Mermaid</text>
  <text x="121" y="506" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/svg-graphics</text>
  <rect x="210" y="408" width="150" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="285" y="434" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">docs</text>
  <text x="285" y="456" text-anchor="middle" font-size="10" fill="#8a8378">README 五段 · 信息密度</text>
  <text x="285" y="474" text-anchor="middle" font-size="10" fill="#8a8378">变更写为什么</text>
  <text x="285" y="506" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/docs</text>
  <rect x="374" y="408" width="150" height="114" fill="#f7e3cf" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="449" y="434" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">thinking-style</text>
  <text x="449" y="456" text-anchor="middle" font-size="10" fill="#8a8378">五步思考流 · 先读后写</text>
  <text x="449" y="474" text-anchor="middle" font-size="10" fill="#8a8378">bug 假设验证</text>
  <text x="449" y="506" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/style-core</text>
  <rect x="538" y="408" width="150" height="114" fill="#f7e3cf" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="613" y="434" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">reply-style</text>
  <text x="613" y="456" text-anchor="middle" font-size="10" fill="#8a8378">结论先行 · 禁 AI 腔</text>
  <text x="613" y="474" text-anchor="middle" font-size="10" fill="#8a8378">全领域差异表</text>
  <text x="613" y="506" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/style-core</text>
  <rect x="702" y="408" width="140" height="114" fill="#f7e3cf" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="772" y="434" text-anchor="middle" font-size="12.5" font-weight="700" fill="#2d2a26">memory</text>
  <text x="772" y="456" text-anchor="middle" font-size="10" fill="#8a8378">三层记忆 · WORKLOG</text>
  <text x="772" y="474" text-anchor="middle" font-size="10" fill="#8a8378">恢复先读后开口</text>
  <text x="772" y="506" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/style-core</text>
  <text x="440" y="548" text-anchor="middle" font-size="10.5" fill="#8a8378">全部分支验证后合入 master　·　{{variable_name}} 占位符一律逐字保留　·　工具链 scripts/ 退出码是唯一裁决</text>
</svg>

## 规范要点

- **门禁体系**：验收标准未定稿不进 Plan；无规划卡（≤10 行）不写代码；无真实运行输出不说"修好了"；测试未全绿不进 Push。
- **记忆纪律**：唯一可信记忆是落盘 WORKLOG；决策/结论/踩坑三类记录检查点立即写；会话恢复先读再开口。
- **反惯性基线**：单函数 ≤40 行、圈复杂度 ≤8、领域命名、注释只写"为什么"、默认零新增依赖。
- **Git 纪律**：原子提交 + Conventional Commits；一分支一主题；共享分支禁 rebase/force-push；已推历史只 revert。
- **退出码裁决**：`verify.ps1` 与 `commit-gate.ps1` 的 exit code 是唯一裁决，`exit 1` 禁止继续。
- **占位符保护**：`{{variable_name}}` 类运行时变量逐字保留。

## 已知限制

- 门禁依赖模型自觉执行（宿主无 pre-commit hook 强制），接入 git hooks 的自动化待做。
- 界面渐变开闸仅限品牌层（图标/logo/Hero），UI 组件仍执行色相 ≤3——边界靠规范约束，无 lint 强制。
- 激活关键词在高度重叠场景（如"前端写代码"命中 3 个 skill）依赖 PROMPT 映射表消歧。
