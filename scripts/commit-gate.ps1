# commit-gate.ps1 — 提交拦截门禁：秘密 / 调试残留 / 超大文件
# 用法: pwsh scripts/commit-gate.ps1   （在 git commit 之前运行；拦截时退出码 1）
$ErrorActionPreference = 'Stop'
$script:fail = 0
function Pass($m) { Write-Output "PASS  $m" }
function Fail($m) { $script:fail++; Write-Output "FAIL  $m" }

$staged = @(git diff --cached --name-only)
if (-not $staged) { Write-Output '无 staged 文件，无需拦截'; exit 0 }

# 秘密特征（正则写法已规避对脚本自身的自匹配）
$secretPatterns = @(
    'BEGIN (RSA|EC|OPENSSH) PRIVATE KEY',
    'sk-[A-Za-z0-9]{20,}',
    'api[_-]?key\s*=\s*[''\"][^''\"]{8,}',
    'password\s*=\s*[''\"][^''\"]{6,}'
)
$debugByExt = @{
    '.js'  = @('console\.log\(', 'debugger;')
    '.jsx' = @('console\.log\(', 'debugger;')
    '.ts'  = @('console\.log\(', 'debugger;')
    '.tsx' = @('console\.log\(', 'debugger;')
    '.py'  = @('pdb\.set_trace\(', 'breakpoint\(')
}

foreach ($f in $staged) {
    if (-not (Test-Path $f)) { continue }  # 已删除的文件跳过内容检查

    # 超大文件拦截
    $size = (Get-Item $f).Length
    if ($size -gt 1MB) { Fail "$f : $([math]::Round($size/1MB,1))MB 超过 1MB，禁止入库" }

    # 秘密扫描（跳过脚本自身，防止规则文本自匹配；一律不区分大小写）
    if ([IO.Path]::GetExtension($f) -notin '.ps1') {
        $lines = Get-Content $f
        for ($i = 0; $i -lt $lines.Count; $i++) {
            foreach ($pat in $secretPatterns) {
                if ($lines[$i] -imatch $pat) { Fail "$f 第$($i+1)行 : 疑似秘密 [$pat]，按泄露处理" }
            }
        }
    }

    # 调试残留扫描
    $ext = [IO.Path]::GetExtension($f)
    if ($debugByExt.ContainsKey($ext)) {
        $lines = Get-Content $f
        for ($i = 0; $i -lt $lines.Count; $i++) {
            foreach ($pat in $debugByExt[$ext]) {
                if ($lines[$i] -imatch $pat) { Fail "$f 第$($i+1)行 : 调试残留 [$pat]" }
            }
        }
    }
}

if ($script:fail -gt 0) { Write-Output '---'; Write-Output "结论: 拦截 $script:fail 项，修复后重新 stage 再提交"; exit 1 }
else { Pass "staged $($staged.Count) 个文件全部通过拦截"; exit 0 }
