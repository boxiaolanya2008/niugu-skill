# niugu-skill

反惯性的全栈开发技能合集：以 **Spec → Plan → Write → Test → Push** 五阶段闭环驱动交付，配套风格重塑、SVG 图形、文档与界面规范，系统性覆盖模型默认训练风格。

## 快速开始

- **OpenCode / Claude 宿主**：将本目录放入 skill 加载路径，frontmatter 中的激活关键词（写代码、修bug、架构图、README……）命中即自动加载 `SKILL.md`。
- **任意其他平台**：将 `PROMPT.md` 全文粘贴为系统提示或会话开场指令，即刻生效。

## 结构说明

<svg viewBox="0 0 880 470" xmlns="http://www.w3.org/2000/svg" font-family="'Segoe UI', 'PingFang SC', 'Microsoft YaHei', sans-serif">
  <defs>
    <marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="#c96f2e"/>
    </marker>
    <marker id="arrowLoop" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 z" fill="#8a8378"/>
    </marker>
  </defs>
  <rect x="0" y="0" width="880" height="470" fill="#faf7f2"/>
  <text x="440" y="42" text-anchor="middle" font-size="22" font-weight="700" fill="#2d2a26">niugu-skill 五阶段闭环与支撑规范</text>
  <text x="440" y="64" text-anchor="middle" font-size="12" fill="#8a8378">每阶段必含：产出 / 验证 / 结论　·　测试未全绿不得进入 Push</text>
  <rect x="36" y="86" width="808" height="118" fill="#f3ece2" stroke="#d8cfbe" stroke-width="1" rx="10"/>
  <text x="52" y="110" font-size="11" font-weight="700" fill="#8a8378">五阶段流水线</text>
  <rect x="52" y="120" width="132" height="66" fill="#ffffff" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="118" y="148" text-anchor="middle" font-size="15" font-weight="700" fill="#2d2a26">Spec</text>
  <text x="118" y="168" text-anchor="middle" font-size="11" fill="#8a8378">规格 · 验收标准</text>
  <line x1="184" y1="153" x2="216" y2="153" stroke="#c96f2e" stroke-width="2" marker-end="url(#arrow)"/>
  <text x="200" y="142" text-anchor="middle" font-size="10" fill="#c96f2e">门禁</text>
  <rect x="218" y="120" width="132" height="66" fill="#ffffff" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="284" y="148" text-anchor="middle" font-size="15" font-weight="700" fill="#2d2a26">Plan</text>
  <text x="284" y="168" text-anchor="middle" font-size="11" fill="#8a8378">规划卡 ≤10 行</text>
  <line x1="350" y1="153" x2="382" y2="153" stroke="#c96f2e" stroke-width="2" marker-end="url(#arrow)"/>
  <text x="366" y="142" text-anchor="middle" font-size="10" fill="#c96f2e">门禁</text>
  <rect x="384" y="120" width="132" height="66" fill="#ffffff" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="450" y="148" text-anchor="middle" font-size="15" font-weight="700" fill="#2d2a26">Write</text>
  <text x="450" y="168" text-anchor="middle" font-size="11" fill="#8a8378">实现 · SVG 同步</text>
  <line x1="516" y1="153" x2="548" y2="153" stroke="#c96f2e" stroke-width="2" marker-end="url(#arrow)"/>
  <text x="532" y="142" text-anchor="middle" font-size="10" fill="#c96f2e">门禁</text>
  <rect x="550" y="120" width="132" height="66" fill="#ffffff" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="616" y="148" text-anchor="middle" font-size="15" font-weight="700" fill="#2d2a26">Test</text>
  <text x="616" y="168" text-anchor="middle" font-size="11" fill="#8a8378">先红后绿 · 三次熔断</text>
  <line x1="682" y1="153" x2="714" y2="153" stroke="#c96f2e" stroke-width="2" marker-end="url(#arrow)"/>
  <text x="698" y="142" text-anchor="middle" font-size="10" fill="#c96f2e">门禁</text>
  <rect x="716" y="120" width="128" height="66" fill="#f7e3cf" stroke="#c96f2e" stroke-width="2" rx="8"/>
  <text x="780" y="148" text-anchor="middle" font-size="15" font-weight="700" fill="#2d2a26">Push</text>
  <text x="780" y="168" text-anchor="middle" font-size="11" fill="#8a8378">提交 · README 交付</text>
  <path d="M 616 186 L 616 218 L 450 218 L 450 192" fill="none" stroke="#8a8378" stroke-width="1.5" stroke-dasharray="5 4" marker-end="url(#arrowLoop)"/>
  <text x="533" y="234" text-anchor="middle" font-size="10" fill="#8a8378">失败未绿：回 Write，三次熔断强制换思路</text>
  <rect x="36" y="252" width="808" height="150" fill="#ffffff" stroke="#d8cfbe" stroke-width="1" rx="10"/>
  <text x="52" y="276" font-size="11" font-weight="700" fill="#8a8378">全程生效的支撑规范（覆盖默认训练风格）</text>
  <rect x="56" y="292" width="180" height="92" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="146" y="322" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">风格重塑</text>
  <text x="146" y="344" text-anchor="middle" font-size="10.5" fill="#8a8378">≤40 行 / 复杂度 ≤8</text>
  <text x="146" y="362" text-anchor="middle" font-size="10.5" fill="#8a8378">领域命名 · 注释只写为什么</text>
  <rect x="256" y="292" width="180" height="92" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="346" y="322" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">SVG 图形</text>
  <text x="346" y="344" text-anchor="middle" font-size="10.5" fill="#8a8378">架构图 / 流程图一律 SVG</text>
  <text x="346" y="362" text-anchor="middle" font-size="10.5" fill="#8a8378">禁止 Mermaid</text>
  <rect x="456" y="292" width="180" height="92" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="546" y="322" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">文档规范</text>
  <text x="546" y="344" text-anchor="middle" font-size="10.5" fill="#8a8378">README 固定五段结构</text>
  <text x="546" y="362" text-anchor="middle" font-size="10.5" fill="#8a8378">信息密度优先 · 禁客套</text>
  <rect x="656" y="292" width="180" height="92" fill="#faf7f2" stroke="#d8cfbe" stroke-width="1.5" rx="8"/>
  <text x="746" y="322" text-anchor="middle" font-size="13" font-weight="700" fill="#2d2a26">界面规范</text>
  <text x="746" y="344" text-anchor="middle" font-size="10.5" fill="#8a8378">色相 ≤3 · 暖色优先</text>
  <text x="746" y="362" text-anchor="middle" font-size="10.5" fill="#8a8378">WCAG AA · 间距刻度</text>
  <line x1="56" y1="432" x2="84" y2="432" stroke="#c96f2e" stroke-width="2" marker-end="url(#arrow)"/>
  <text x="92" y="436" font-size="10.5" fill="#8a8378">阶段流转（带门禁）</text>
  <line x1="220" y1="432" x2="248" y2="432" stroke="#8a8378" stroke-width="1.5" stroke-dasharray="5 4" marker-end="url(#arrowLoop)"/>
  <text x="256" y="436" font-size="10.5" fill="#8a8378">失败回路</text>
  <text x="824" y="436" text-anchor="end" font-size="10.5" fill="#8a8378">{{variable_name}} 占位符一律逐字保留</text>
</svg>

## 规范要点

- **五阶段门禁**：Spec 验收标准未定稿不进 Plan；无规划卡不写代码；测试无真实运行输出不说"修好了"；同一错误三次失败强制熔断换思路。
- **风格重塑**：单函数 ≤40 行、领域命名、注释只写"为什么"、默认零新增依赖；界面色相 ≤3、暖色优先、WCAG AA。
- **图形一律 SVG**：显式 `viewBox`/`xmlns`、`text-anchor="middle"`、暖色克制配色；禁止 Mermaid。
- **文档即产物**：README 固定五段结构（定位 → 快速开始 → 结构说明 → 规范要点 → 已知限制），与代码同等重要。
- **占位符保护**：`{{variable_name}}` 类运行时变量逐字保留，不得改名、删除或替换。

## 已知限制

- 单 skill 合集形态：全部规范集中于 `SKILL.md`，未按场景拆分为多个独立 skill；若需要精细的按场景激活，需后续拆分。
- 五阶段门禁依赖模型自觉遵守，无宿主级强制执行机制。
