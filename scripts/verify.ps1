# verify.ps1 — 交付门禁：一键校验整个 skill 仓库
# 用法: pwsh scripts/verify.ps1   （全 PASS 退出码 0，否则 1）
param([string]$Root = (Get-Location).Path)
$ErrorActionPreference = 'Stop'
Set-Location $Root
$script:fail = 0
function Pass($m) { Write-Output "PASS  $m" }
function Fail($m) { $script:fail++; Write-Output "FAIL  $m" }

# 1. 每个 skill 必须有完整 frontmatter（name + description）
$skillDirs = Get-ChildItem skills -Directory
if (-not $skillDirs) { Fail 'skills/ 下没有任何 skill 目录' }
foreach ($s in $skillDirs) {
    $p = Join-Path $s.FullName 'SKILL.md'
    if (-not (Test-Path $p)) { Fail "$($s.Name): 缺 SKILL.md"; continue }
    $raw = Get-Content $p -Raw
    if ($raw -match '(?s)^---\s*\nname:\s*\S+.*?description:\s*\S+.*?---') {
        Pass "$($s.Name): frontmatter 完整"
    } else {
        Fail "$($s.Name): frontmatter 缺 name 或 description"
    }
}

# 2. 所有 SVG 必须 XML well-formed 且声明 viewBox
Get-ChildItem -Recurse -Include *.svg | ForEach-Object {
    $rel = $_.FullName.Substring((Get-Location).Path.Length + 1)
    try {
        $doc = [xml](Get-Content $_.FullName -Raw)
        if ($doc.svg -and $doc.svg.viewBox) { Pass "$rel : XML + viewBox" }
        else { Fail "$rel : 缺 viewBox" }
    } catch { Fail "$rel : XML 解析失败 $($_.Exception.Message)" }
}

# 3. 禁止 Mermaid 代码块（按代码块签名匹配，不误伤禁令文字）
$mermaid = Get-ChildItem -Recurse -Include *.md,*.svg | Select-String -Pattern '^```mermaid'
if ($mermaid) { Fail "发现 Mermaid 代码块: $($mermaid.Path -join ', ')" } else { Pass '全库无 Mermaid 代码块' }

# 4. 变量占位符逐字保留（出现 {{ 的文件必须含 {{variable_name}} 原文或说明用途）
$brace = Get-ChildItem -Recurse -Include *.md | Where-Object { (Get-Content $_.FullName -Raw) -match '\{\{' }
foreach ($f in $brace) {
    $raw = Get-Content $f.FullName -Raw
    if ($raw -match '\{\{variable_name\}\}') { Pass "$($f.Name): 占位符逐字保留" }
    else { Fail "$($f.Name): 出现 {{ 但未保留 {{variable_name}} 原文" }
}

Write-Output '---'
if ($script:fail -gt 0) { Write-Output "结论: $script:fail 项失败，禁止交付"; exit 1 }
else { Write-Output "结论: 全部通过，共 $($skillDirs.Count) 个 skill"; exit 0 }
