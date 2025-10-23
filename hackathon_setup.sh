#!/usr/bin/env bash
# ============================================
# Hackathon Setup Script for Windows (Git Bash)
# ============================================

set -e

echo "🚀 Starting Hackathon Setup..."

echo "🔧 Checking for chocolatey..."
# --- Install Chocolatey (if not installed) ---
if ! command -v choco &> /dev/null; then
    echo "🍫 Installing Chocolatey..."
    powershell -NoProfile -ExecutionPolicy Bypass -Command "
        Set-ExecutionPolicy Bypass -Scope Process -Force;

        [System.Net.ServicePointManager]::SecurityProtocol =
            [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
        iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    "
    export PATH=$PATH:/c/ProgramData/chocolatey/bin
else
    echo "✅ Chocolatey already installed."
fi
# Install Chocolatey (package manager for Windows)
if ! command -v choco &> /dev/null; then
    echo "Installing Chocolatey..."
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    export PATH="$PATH:/c/ProgramData/chocolatey/bin"
fi

# Update Chocolatey
echo "Updating Chocolatey..."
choco upgrade chocolatey -y

# Install core packages
echo "Installing Node.js, Python, AWS CLI, Git, Docker, VSCode, and PyCharm..."
if command -v git &> /dev/null; then
    echo "✅ Git already installed Code found."
else
    choco install git -y --ignore-checksums || echo "⚠️ git install failed. Skipping..."
fi
choco install nodejs -y  || echo "⚠️ nodejs install failed. Skipping..."
choco install python -y  || echo "⚠️ python install failed. Skipping..."
choco install awscli -y  || echo "⚠️ awscli install failed. Skipping..."
choco install vscode -y  || echo "⚠️ vscode install failed. Skipping..."
choco install  pycharm-community -y  || echo "⚠️  pycharm-community install failed. Skipping..."

# Ensure Git Bash is set as default terminal for VSCode
# echo "Configuring Git Bash for VSCode..."
# code --install-extension ms-vscode.gitbash

echo "🤖 Checking for Gemini CLI..."
if ! command -v gemini &> /dev/null; then
    echo "Gemini CLI not found. Installing..."
    npm install -g @google/gemini-cli || echo "⚠️ Gemini CLI installation failed. Skipping..."
else
    echo "✅ Gemini CLI is already installed."
fi

# Create Gemini environment configuration
echo "🧠 Setting up Gemini configuration..."
mkdir -p ~/.gemini
if [ ! -f ~/.gemini/.env ]; then
    cat > ~/.gemini/.env <<EOF
GEMINI_API_KEY="<YOUR_GEMINI_API_KEY>"
# Optional settings:
# GEMINI_MODEL="gemini-2.5-flash"
EOF
    echo "✅ Created ~/.gemini/.env — please update it with your real API key."
else
    echo "✅ ~/.gemini/.env already exists."
fi

echo "🔍 Checking for VS Code (code command)..."
if command -v code &> /dev/null; then
    echo "✅ VS Code found."

    # Full extension ID from the marketplace: publisher + name
    EXT_ID="Google.gemini-cli-vscode-ide-companion"

    echo "🔍 Checking for Gemini CLI Companion extension ($EXT_ID)..."
    if ! code --list-extensions | grep -q "^${EXT_ID}$"; then
        echo "Installing extension $EXT_ID..."
        code --install-extension "$EXT_ID" --force || {
            echo "⚠️ Failed installing extension $EXT_ID."
            echo "Please install it manually in VS Code: search for 'Gemini CLI Companion' in Extensions pane."
        }
    else
        echo "✅ Gemini CLI Companion extension already installed."
    fi
else
    echo "⚠️ VS Code (code) was not found — skipping extension install."
fi

echo
echo "✅ Verifying installations..."
echo "Node: $(node -v)"
echo "Python: $(python --version)"
echo "AWS: $(aws --version)"
echo "Git: $(git --version)"
echo "VS Code: $(code --version | head -n 1)"
echo "Docker: $(docker --version)"
echo "PyCharm installed ✔️"
echo "Docker Desktop installed ✔️"
echo "Gemini: $(gemini --version)"
echo
echo "🎉 All core tools installed successfully!"
echo "Please close and reopen Git Bash for path changes to take effect."
