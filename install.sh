#!/usr/bin/env bash

set -e

echo "[SentinelShell] Installing..."

# Ensure dependencies
if ! command -v pipx >/dev/null 2>&1; then
    echo "[+] Installing pipx..."
    sudo apt install -y pipx || sudo pacman -S pipx || brew install pipx
fi

echo "[+] Installing OpenAI CLI..."
pipx install openai --force

echo "[+] Installing ripgrep..."
sudo apt install -y ripgrep || sudo pacman -S ripgrep || brew install ripgrep

echo "[+] Installing gpt-session..."
chmod +x gpt-session
sudo mv gpt-session /usr/local/bin/

echo "[✓] Installation complete!"

