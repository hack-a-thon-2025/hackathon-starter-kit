#!/usr/bin/env bash
# ============================================
# Hackathon Uninstall Script for Windows (Git Bash)
# ============================================
# Have to run as an administrator

set -e

echo "🚀 Starting Hackathon Uninstall..."

echo "🗑️ Uninstalling Chocolatey packages..."
choco uninstall git -y || echo "⚠️ git uninstall failed. Skipping..."
choco uninstall nodejs -y || echo "⚠️ nodejs uninstall failed. Skipping..."
choco uninstall python -y || echo "⚠️ python uninstall failed. Skipping..."
choco uninstall awscli -y || echo "⚠️ awscli uninstall failed. Skipping..."
choco uninstall vscode -y || echo "⚠️ vscode uninstall failed. Skipping..."
choco uninstall pycharm-community -y || echo "⚠️ pycharm-community uninstall failed. Skipping..."

echo "🗑️ Uninstalling Gemini CLI..."
npm uninstall -g @google/gemini-cli || echo "⚠️ Gemini CLI uninstall failed. Skipping..."

echo "🗑️ Uninstalling VS Code extension..."
code --uninstall-extension Google.gemini-cli-vscode-ide-companion || echo "⚠️ VS Code extension uninstall failed. Skipping..."

echo "🗑️ Removing Gemini configuration..."
rm -rf ~/.gemini || echo "⚠️ Gemini configuration removal failed. Skipping..."

echo "✅ Hackathon uninstall complete!"
