# Usage: .\make.ps1 <target>
# Targets: install | jupyter | clean | help

param([string]$Target = "help")

$VenvPython  = ".venv\Scripts\python.exe"
$VenvJupyter = ".venv\Scripts\jupyter.exe"

switch ($Target) {
    "install" {
        Write-Host "==> Creating virtual environment ..." -ForegroundColor Cyan
        python -m venv .venv
        Write-Host "==> Upgrading pip ..." -ForegroundColor Cyan
        & .venv\Scripts\pip.exe install --upgrade pip
        Write-Host "==> Installing dependencies ..." -ForegroundColor Cyan
        & .venv\Scripts\pip.exe install -r requirements.txt
        Write-Host ""
        Write-Host "Done! Activate with:" -ForegroundColor Green
        Write-Host "  .\.venv\Scripts\Activate.ps1" -ForegroundColor Yellow
    }
    "jupyter" {
        if (-not (Test-Path $VenvJupyter)) {
            Write-Host "ERROR: .venv not found. Run '.\make.ps1 install' first." -ForegroundColor Red
            exit 1
        }
        & $VenvJupyter notebook
    }
    "clean" {
        Write-Host "==> Removing .venv ..." -ForegroundColor Cyan
        Remove-Item -Recurse -Force .venv -ErrorAction SilentlyContinue
        Write-Host "Done." -ForegroundColor Green
    }
    default {
        Write-Host ""
        Write-Host "  .\make.ps1 install    Create .venv and install deps"
        Write-Host "  .\make.ps1 jupyter    Start Jupyter inside the venv"
        Write-Host "  .\make.ps1 clean      Delete the .venv folder"
        Write-Host ""
        Write-Host "  After install, activate with:" -ForegroundColor Green
        Write-Host "    .\.venv\Scripts\Activate.ps1" -ForegroundColor Yellow
        Write-Host ""
    }
}
