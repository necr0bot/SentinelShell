#!/usr/bin/env bash
set -e

echo "[+] SentinelShell installer starting..."

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
    echo "[+] Installing package: $pkgname"

    if [[ "$PKG" == "apt" ]]; then
        sudo apt update -y
        sudo apt install -y "$pkgname"
    elif [[ "$PKG" == "pacman" ]]; then
        sudo pacman -Sy --noconfirm "$pkgname"
    elif [[ "$PKG" == "brew" ]]; then
        brew install "$pkgname"
    else
        echo "[!] Unknown package manager. Please install '$pkgname' manually."
    fi
}

# Ensure pipx
if ! command -v pipx >/dev/null 2>&1; then
    echo "[+] pipx not found — installing..."
    install_pkg pipx || echo "[!] pipx could not be auto-installed."
else
    echo "[+] pipx already installed."
fi

# Ensure OpenAI CLI via pipx
if ! command -v openai >/dev/null 2>&1; then
    echo "[+] Installing OpenAI CLI via pipx..."
    pipx install openai || echo "[!] OpenAI CLI failed to install. Install manually with: pipx install openai"
else
    echo "[+] OpenAI CLI already installed."
fi

# Ensure ripgrep
if ! command -v rg >/dev/null 2>&1; then
    echo "[+] Installing ripgrep..."
    install_pkg ripgrep || echo "[!] Please install ripgrep manually."
else
    echo "[+] ripgrep already installed."
fi

# Ensure session directory exists
mkdir -p ~/.gpt_sessions

# Install gpt-session script
echo "[+] Installing gpt-session to /usr/local/bin..."
chmod +x gpt-session
sudo cp gpt-session /usr/local/bin/

echo "[✓] SentinelShell installation complete!"
echo "Run: gpt-session start"
