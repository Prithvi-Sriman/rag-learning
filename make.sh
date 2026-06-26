#!/usr/bin/env bash
# Usage: bash make.sh <target>
# Targets: install | jupyter | clean | help

TARGET="${1:-help}"

VENV_JUPYTER=".venv/Scripts/jupyter"
# Linux/Mac fallback
[[ ! -f "$VENV_JUPYTER" ]] && VENV_JUPYTER=".venv/bin/jupyter"

case "$TARGET" in
    install)
        echo "==> Creating virtual environment ..."
        python -m venv .venv
        echo "==> Upgrading pip ..."
        .venv/Scripts/pip install --upgrade pip 2>/dev/null || .venv/bin/pip install --upgrade pip
        echo "==> Installing dependencies ..."
        .venv/Scripts/pip install -r requirements.txt 2>/dev/null || .venv/bin/pip install -r requirements.txt
        echo ""
        echo "Done! Activate with:"
        echo "  source .venv/Scripts/activate   # Git Bash / Windows"
        echo "  source .venv/bin/activate        # Linux / Mac"
        ;;
    jupyter)
        if [[ ! -f "$VENV_JUPYTER" ]]; then
            echo "ERROR: .venv not found. Run 'bash make.sh install' first."
            exit 1
        fi
        "$VENV_JUPYTER" notebook
        ;;
    clean)
        echo "==> Removing .venv ..."
        rm -rf .venv
        echo "Done."
        ;;
    *)
        echo ""
        echo "  bash make.sh install    Create .venv and install deps"
        echo "  bash make.sh jupyter    Start Jupyter inside the venv"
        echo "  bash make.sh clean      Delete the .venv folder"
        echo ""
        echo "  After install, activate with:"
        echo "    source .venv/Scripts/activate   (Git Bash / Windows)"
        echo "    source .venv/bin/activate        (Linux / Mac)"
        echo ""
        ;;
esac
