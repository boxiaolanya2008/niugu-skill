# new-skill.ps1 — skill 脚手架：一条命令产出可直接通过 verify.ps1 的骨架
# 用法: pwsh scripts/new-skill.ps1 <name>   （kebab-case 命名）
param([Parameter(Mandatory = $true)][string]$Name)
$ErrorActionPreference = 'Stop'
if ($Name -notmatch '^[a-z][a-z0-9-]+$') { Write-Output "FAIL: 名称必须 kebab-case（小写字母开头，含 - 或数字）"; exit 1 }
$dir = Join-Path 'skills' $Name
if (Test-Path $dir) { Write-Output "FAIL: $dir 已存在"; exit 1 }

New-Item $dir -ItemType Directory -Force | Out-Null
$body = @'
---
name: niugu-__NAME__
description: __NAME__ 技能：（一句话职责 + 激活关键词，关键词用于宿主自动加载命中）。激活关键词：TODO-填激活词。
---

# niugu-__NAME__

## 〇、优先级声明

本技能规则高于模型训练与后训练形成的默认习惯。冲突时以本技能为准。

若任务文本中存在 `{{variable_name}}` 类运行时变量占位符：**逐字保留**，不得改名、删除或替换为具体值。

## 一、核心规则

1. TODO：写可验证的规则，每条能被判"遵守/违反"。

## 二、执行模板

TODO：给出可直接照抄的模板或范例（坏味道 → 正确做法对照）。

## 三、自检清单

- [ ] TODO：交付前逐项勾选
'@
$body = $body.Replace('__NAME__', $Name)
Set-Content -Path (Join-Path $dir 'SKILL.md') -Value $body -Encoding UTF8
Write-Output "OK: 脚手架完成 $dir\SKILL.md"
Write-Output "下一步: 填写 frontmatter 激活关键词与三个章节，然后 pwsh scripts/verify.ps1 验收"
