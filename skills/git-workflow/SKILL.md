---
name: niugu-git-workflow
description: 顶级 Git 工作流技能：原子提交与 Conventional Commits、分支策略与命名、merge/rebase 决策、冲突解决、stash/cherry-pick/bisect/reflog 应急与找回、安全铁律。激活关键词：git、commit、提交、分支、branch、merge、合并、rebase、变基、冲突、回滚、撤销、cherry-pick、stash、bisect、tag、push、pull、PR。任何涉及 git 操作、提交、分支管理、版本回退的任务必须使用本技能。
---

# niugu-git-workflow — 顶级 Git 使用规范

## 〇、优先级声明

本技能是 git 操作争议的最终裁决标准，高于模型默认的"随手 commit / 直接 push master"惯性。

若任务文本中存在 `{{variable_name}}` 类运行时变量占位符：**逐字保留**，不得改名、删除或替换为具体值。

---

## 一、安全铁律（违反即事故）

1. **禁止对共享分支（master/main/develop）`push --force`**；确需覆盖用 `--force-with-lease`，且仅在确认无他人提交后。
2. **禁止对共享分支 `reset --hard`**；已推送的提交要撤销用 `git revert`。
3. 提交前必看：`git status` + `git diff`（staged 用 `git diff --staged`），**禁止盲提交**。
4. **禁止提交秘密**：密钥、token、密码、`.env` 实值——发现即停止，加入 `.gitignore`；已提交的按泄露处理（换密钥，不只是删文件）。
5. 任何未验证的大改动，先开分支；主干永远保持可构建。
6. 不提交构建产物、依赖目录、IDE 配置（`.gitignore` 兜底）。

---

## 二、提交纪律（Commit）

### 2.1 原子性

- **一个提交只表达一个意图**：一个功能、一个修复、一次纯重构，三选一，禁止混合。
- 格式化、重构与功能改动禁止塞进同一提交（review 无法分辨）。
- 提交时机：每完成一个**可编译、可验证**的原子步骤即提交，不攒"一周大提交"。

### 2.2 提交信息（Conventional Commits）

```
<类型>(<范围>): <祈使句摘要，≤50 字，不加句号>

<正文：为什么改，而非改了什么——diff 已说明 what；≤72 字/行>

<页脚：BREAKING CHANGE: 说明 / Closes #123 / Refs #456>
```

类型限定：`feat / fix / refactor / docs / test / chore / perf / build / ci`。

| 场景 | 示例 |
| --- | --- |
| 功能 | `feat(auth): 新增登录失败三次锁定门禁` |
| 修复 | `fix(invoice): 税率越界时抛出 RangeError 而非静默返回 0` |
| 破坏性 | `feat(api)!: 移除 v1 接口` + 页脚 `BREAKING CHANGE: ...` |

### 2.3 提交前自检

- [ ] `git status` 无意外文件；调试代码、临时刻意输出已移除
- [ ] `git diff --staged` 全部看过一遍，无秘密、无垃圾
- [ ] 摘要用祈使句（"新增"而非"新增了"），正文回答"为什么"
- [ ] 提交后 `git log -1 --stat` 复核

---

## 三、分支策略（Branch）

### 3.1 命名

`<类型>/<简短主题>-kebab-case`，类型限定：

| 前缀 | 用途 | 示例 |
| --- | --- | --- |
| `feat/` | 新功能 | `feat/login-gate` |
| `fix/` | 缺陷修复 | `fix/tax-overflow` |
| `hotfix/` | 生产紧急修复（从 master 拉，修完即合） | `hotfix/payment-crash` |
| `refactor/` | 重构（不改行为） | `refactor/split-invoice` |
| `docs/` | 纯文档 | `docs/readme-quickstart` |
| `chore/` | 构建、依赖、杂项 | `chore/bump-deps` |

### 3.2 生命周期

```
从最新 master 创建 → 一分支一主题开发 → 验证通过 → 合入 master → 删除分支
```

- 建分支前先 `git pull`/`fetch`，从**最新**主干拉出，禁止从陈旧基线分叉。
- 一分支一主题；发现顺手要改无关问题 → 新开分支。
- 合入后立即删除本地与远端分支：`git branch -d <名>` / `git push origin --delete <名>`。
- 长期存在的分支是坏味道：超过 3 天未合入需说明原因或拆小。

---

## 四、合并策略（Merge / Rebase 决策）

| 场景 | 用什么 | 理由 |
| --- | --- | --- |
| 本地私有分支、未推送 | `git rebase` 整理 | 历史线性干净，无人受影响 |
| feature 合入 master | `git merge --no-ff` 或平台 squash | 保留主题边界或压缩为单提交 |
| 已推送到共享分支的提交 | **禁止 rebase**，用 `merge` 或 `revert` | rebase 改写历史会让协作者爆炸 |
| 需要另一个分支的某一个提交 | `git cherry-pick <hash>` | 精准移植，不带整条历史 |

**冲突解决流程**：
1. `git status` 列出全部冲突文件，逐个处理，禁止 `git checkout --theirs/--ours` 一把梭。
2. 逐块（hunk）审查：理解双方意图再决定保留哪边或融合。
3. 解决后**必须跑测试**再 `git add` + `git commit`（merge 继续）。
4. 复杂冲突（>3 文件或语义冲突）：找改动作者对齐，不猜。

---

## 五、应急与找回

| 场景 | 命令 | 说明 |
| --- | --- | --- |
| 撤销未推送的最后一次提交（留改动） | `git reset --soft HEAD~1` | 改动回暂存区 |
| 撤销未推送的最后一次提交（不留改动） | `git reset --hard HEAD~1` | **仅限未推送** |
| 撤销已推送的提交 | `git revert <hash>` | 生成反向提交，安全 |
| 临时存工作区 | `git stash push -m "写明内容"` | 带消息，禁止裸 `git stash` |
| 恢复 stash | `git stash pop`（取最新）/ `git stash apply stash@{n}` | 先 `git stash list` 确认 |
| 找回"消失"的提交 | `git reflog` → `git reset --hard <hash>` | reflog 是本地后悔药，90 天有效 |
| 定位引入 bug 的提交 | `git bisect start` → 标好坏两端 → 二分验证 | 配合测试脚本全自动 |
| 给发布打标 | `git tag -a v1.2.0 -m "说明"` | 语义化版本，禁止轻量 tag |

**revert vs reset 决策一句话**：提交已推给别人 → `revert`；只存在本地 → `reset`。

---

## 六、多分支交付纪律（本体系执行标准）

- 每个功能单元/技能模块独立 `feat/<名>` 分支开发，验证通过后按序合入主干。
- 合并顺序尊重依赖：被依赖的先合。
- 合并后跑全量校验再宣告完成；分支保留至验证完成后按需删除。

## 七、自检清单

- [ ] 无盲提交：status/diff 已复核，无秘密与调试代码
- [ ] 提交原子且信息符合 Conventional Commits，正文写"为什么"
- [ ] 分支命名规范、一分支一主题、从最新主干拉出
- [ ] 共享分支未被 rebase/force-push
- [ ] 冲突逐块解决且解决后跑了测试
- [ ] 已推送历史只 revert 不 reset
- [ ] `{{variable_name}}` 占位符逐字保留
