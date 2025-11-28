#!/bin/bash

echo "[+] Installing SentinelShell..."

if ! command -v openai >/dev/null 2>&1; then
    echo "[-] OpenAI CLI not found. Install with:"
    echo "    pipx install openai"
    exit 1
fi

sudo cp gpt-session /usr/local/bin/
sudo chmod +x /usr/local/bin/gpt-session

mkdir -p ~/.gpt_sessions

echo "[+] Installation complete!"
echo "[+] Run: gpt-session start"
