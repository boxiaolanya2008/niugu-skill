# niugu-skill

反惯性的全栈开发 skill 体系：`PROMPT.md` 总控枢纽驱动 5 个独立 skill，覆盖 **Spec → Plan → Write → Test → Push** 全流程，系统性覆盖模型默认训练风格。

## 快速开始

- **任意平台**：将 `PROMPT.md` 全文作为系统提示粘贴——它强制读取者在读完 Prompt 后立即读取全部 5 个 skill 文件。
- **OpenCode / Claude 宿主**：将本目录放入 skill 加载路径，各 `skills/*/SKILL.md` 的 frontmatter 激活关键词命中即自动加载。

```
git clone <repo> && cat PROMPT.md
# 会话开场指令粘贴 PROMPT.md 全文即可
```

## 结构说明

| 路径 | 职责 | 交付分支 |
| --- | --- | --- |
| `PROMPT.md` | 总控枢纽：强制第一步读取全部 skill + 场景映射表 | feat/hub |
| `skills/orchestration/SKILL.md` | 五阶段闭环、门禁 G1–G4、三次熔断、记忆落盘 | feat/orchestration |
| `skills/style-reset/SKILL.md` | 反惯性编码：红线、命名、注释、坏味道对照 | feat/style-reset |
| `skills/interface/SKILL.md` | 界面纪律：配色、字体气质表、间距刻度、现代图标（squircle+渐变）、落地页 Hero | feat/interface → feat/icon-visual |
| `skills/svg-graphics/SKILL.md` | SVG 图形规范：配色令牌、三种图式模板（禁 Mermaid） | feat/svg-graphics |
| `skills/docs/SKILL.md` | README 五段结构、信息密度、变更记录写为什么 | feat/docs |
| `assets/architecture.svg` | 体系架构图（本图内嵌于下方） | feat/hub |
| `assets/icon-sample.svg` | 现代图标样例：白 squircle + 蓝紫渐变粗圆笔触字形 | feat/icon-visual |

<svg viewBox="0 0 880 440" xmlns="http://www.w3.org/2000/svg" font-family="'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif">
  <defs>
    <marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="#c96f2e"/>
    </marker>
  </defs>
  <rect x="0" y="0" width="880" height="440" fill="#faf7f2"/>
  <text x="440" y="42" text-anchor="middle" font-size="22" font-weight="700" fill="#2d2a26">niugu-skill 体系架构：Prompt 枢纽驱动多 skill</text>
  <text x="440" y="64" text-anchor="middle" font-size="12" fill="#8a8378">读完 Prompt 强制读取全部 skill 文件 → 按场景主动调用</text>
  <rect x="240" y="88" width="400" height="72" fill="#f7e3cf" stroke="#c96f2e" stroke-width="2" rx="10"/>
  <text x="440" y="118" text-anchor="middle" font-size="16" font-weight="700" fill="#2d2a26">PROMPT.md 总控枢纽</text>
  <text x="440" y="142" text-anchor="middle" font-size="11" fill="#8a8378">强制第一步：读取下述 5 个 skill 文件</text>
  <line x1="440" y1="160" x2="440" y2="196" stroke="#c96f2e" stroke-width="2" marker-end="url(#arrow)"/>
  <text x="440" y="184" text-anchor="middle" font-size="10" fill="#c96f2e">读取后立即加载</text>
  <rect x="36" y="200" width="808" height="170" fill="#ffffff" stroke="#d8cfbe" stroke-width="1" rx="10"/>
  <text x="52" y="224" font-size="11" font-weight="700" fill="#8a8378">skills/（各自独立分支交付）</text>
  <rect x="52" y="238" width="146" height="114" fill="#faf7f2" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="125" y="266" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">orchestration</text>
  <text x="125" y="288" text-anchor="middle" font-size="10.5" fill="#8a8378">五阶段闭环</text>
  <text x="125" y="306" text-anchor="middle" font-size="10.5" fill="#8a8378">门禁 G1–G4</text>
  <text x="125" y="324" text-anchor="middle" font-size="10.5" fill="#8a8378">三次熔断 · 记忆落盘</text>
  <text x="125" y="342" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/orchestration</text>
  <rect x="222" y="238" width="146" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="295" y="266" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">style-reset</text>
  <text x="295" y="288" text-anchor="middle" font-size="10.5" fill="#8a8378">反惯性编码风格</text>
  <text x="295" y="306" text-anchor="middle" font-size="10.5" fill="#8a8378">红线 · 领域命名</text>
  <text x="295" y="324" text-anchor="middle" font-size="10.5" fill="#8a8378">注释只写为什么</text>
  <text x="295" y="342" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/style-reset</text>
  <rect x="392" y="238" width="146" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="465" y="266" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">interface</text>
  <text x="465" y="288" text-anchor="middle" font-size="10.5" fill="#8a8378">界面视觉纪律</text>
  <text x="465" y="306" text-anchor="middle" font-size="10.5" fill="#8a8378">色相 ≤3 · 暖色优先</text>
  <text x="465" y="324" text-anchor="middle" font-size="10.5" fill="#8a8378">WCAG AA · 间距刻度</text>
  <text x="465" y="342" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/interface</text>
  <rect x="562" y="238" width="146" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="635" y="266" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">svg-graphics</text>
  <text x="635" y="288" text-anchor="middle" font-size="10.5" fill="#8a8378">SVG 图形规范</text>
  <text x="635" y="306" text-anchor="middle" font-size="10.5" fill="#8a8378">配色令牌 · 图式模板</text>
  <text x="635" y="324" text-anchor="middle" font-size="10.5" fill="#8a8378">禁止 Mermaid</text>
  <text x="635" y="342" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/svg-graphics</text>
  <rect x="732" y="238" width="112" height="114" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="788" y="266" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">docs</text>
  <text x="788" y="288" text-anchor="middle" font-size="10.5" fill="#8a8378">README 五段结构</text>
  <text x="788" y="306" text-anchor="middle" font-size="10.5" fill="#8a8378">信息密度优先</text>
  <text x="788" y="324" text-anchor="middle" font-size="10.5" fill="#8a8378">变更记录写为什么</text>
  <text x="788" y="342" text-anchor="middle" font-size="9.5" fill="#c96f2e">feat/docs</text>
  <text x="440" y="404" text-anchor="middle" font-size="10.5" fill="#8a8378">全部分支验证后合入 master　·　{{variable_name}} 占位符一律逐字保留</text>
  <text x="440" y="424" text-anchor="middle" font-size="10.5" fill="#8a8378">文档遵循 docs skill　·　本图遵循 svg-graphics skill</text>
</svg>

## 规范要点

- **枢纽强制加载**：PROMPT.md 读完即必须读取 5 个 skill 文件，缺失报错、禁止臆造。
- **场景精确映射**：编码→orchestration+style-reset；前端→+interface；图形→svg-graphics；文档→docs。
- **五阶段门禁**：验收标准未定稿不进 Plan；无规划卡不写代码；无运行证据不说"修好了"；测试未全绿不进 Push。
- **反惯性基线**：单函数 ≤40 行、色相 ≤3、图形一律 SVG 禁 Mermaid、文档五段固定结构。
- **品牌视觉开闸**：渐变仅限图标/logo/Hero（白 squircle + 对角渐变粗圆笔触字形；Hero 用悬浮胶囊导航 + 主视觉光晕），UI 组件仍保持克制。
- **分支交付**：每个 skill 独立 `feat/*` 分支开发并验证，合入 master 保证可追溯。

## 已知限制

- 门禁依赖模型自觉遵守，宿主无法强制执行。
- 各 skill 的激活关键词在高度重叠场景（如"前端写代码"同时命中 3 个）依赖枢纽的映射表消歧，纯关键词自动激活时可能重复加载。
