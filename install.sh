#!/usr/bin/env bash
set -e

echo "[+] SentinelShell installer"

# Detect package manager
if command -v apt >/dev/null 2>&1; then
    PKG="apt"
elif command -v pacman >/dev/null 2>&1; then
    PKG="pacman"
elif command -v brew >/dev/null 2>&1; then
    PKG="brew"
else
    PKG=""
fi

install_pkg() {
    local pkgname="$1"
    if [[ "$PKG" == "apt" ]]; then
        sudo apt update -y
        sudo apt install -y "$pkgname"
    elif [[ "$PKG" == "pacman" ]]; then
        sudo pacman -Sy --noconfirm "$pkgname"
    elif [[ "$PKG" == "brew" ]]; then
        brew install "$pkgname"
    else
        echo "[-] Could not detect package manager. Please install $pkgname manually."
    fi
}

if ! command -v pipx >/dev/null 2>&1; then
    echo "[+] Installing pipx..."
    install_pkg pipx || echo "[!] Please install pipx manually."
fi

if ! command -v openai >/dev/null 2>&1; then
    echo "[+] Installing OpenAI CLI via pipx..."
    pipx install openai || echo "[!] Please install OpenAI CLI manually."
fi

if ! command -v rg >/dev/null 2>&1; then
    echo "[+] Installing ripgrep..."
    install_pkg ripgrep || echo "[!] Please install ripgrep manually."
fi

mkdir -p ~/.gpt_sessions

echo "[+] Installing gpt-session to /usr/local/bin"
chmod +x gpt-session
sudo cp gpt-session /usr/local/bin/

echo "[✓] SentinelShell installed."
echo "    Run: gpt-session start"
