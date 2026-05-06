# plugin-freedom-system Windows System Validation Script
# PowerShell for Windows 11

Write-Host "=== Plugin Freedom System - Windows Validation ===" -ForegroundColor Cyan

# Check Python
try {
    $python = Get-Command python -ErrorAction SilentlyContinue
    $pyVersion = & $python --version 2>&1
    Write-Host "[OK] Python: $pyVersion" -ForegroundColor Green
} catch {
    Write-Host "[FAIL] Python not found" -ForegroundColor Red
}

# Check CMake
try {
    $cmake = Get-Command cmake -ErrorAction SilentlyContinue
    $cmakeVer = & $cmake --version 2>&1
    Write-Host "[OK] CMake: $cmakeVer" -ForegroundColor Green
} catch {
    Write-Host "[FAIL] CMake not found" -ForegroundColor Red
}

# Check Node.js
try {
    $node = Get-Command node -ErrorAction SilentlyContinue
    Write-Host "[OK] Node.js: $($node.Version)" -ForegroundColor Green
} catch {
    Write-Host "[WARN] Node.js not found (optional)" -ForegroundColor Yellow
}

# Check pkgconf Python package
try {
    & python -m pkgconf --version 2>&1 | Out-Null
    Write-Host "[OK] pkgconf Python package: installed" -ForegroundColor Green
} catch {
    Write-Host "[FAIL] pkgconf Python package not found" -ForegroundColor Red
}

Write-Host "`n=== Environment Ready ===" -ForegroundColor Green
