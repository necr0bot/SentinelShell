<p align="center">
  <img src="screenshots/banner.png" alt="SentinelShell Banner" width="900">
</p>

SentinelShell

AI-Powered Terminal Session Logging, Redaction, Summaries & Syncing

---------------------

SentinelShell is a drop-in terminal enhancer that automatically:

📜 Records your terminal session

🔍 Scrubs secrets in real-time

🤖 Generates AI summaries using OpenAI’s CLI

🔄 Optional: Auto-syncs your logs

🧠 Optional: Creates context profiles for ChatGPT

🛑 Lets you pause, stop, replay, or summarize sessions at will

Perfect for CTF writeups, cybersecurity labs, demos, documentation, education, and research.

---------------------

🚀 Features

📼 Record full terminal sessions

Uses script under the hood. No weird Tmux hacks.

---------------------

🧼 Real-time secret redaction

Built-in patterns remove:

passwords

secrets

API keys

Authorization: Bearer tokens

VPN IPs

env vars

---------------------

🧠 AI summaries of your work

At session end:

gpt-session stop

→ Creates:
session.log.summary.md

---------------------

🕹 Commands

gpt-session start ---> # Begin logging

gpt-session stop ---> # Stop and summarize

gpt-session replay ---> # Replay the session

gpt-session profile ---> # Generate ChatGPT context

gpt-session sync ---> # Upload log via OpenAI CLI

gpt-session autosync-on ---> # Auto-sync every N minutes

gpt-session autosync-off ---> # Disable autosync

---------------------

📦 Installation

curl -sSL https://raw.githubusercontent.com/necr0bot/SentinelShell/main/install.sh | bash

Or manual:

chmod +x gpt-session
sudo mv gpt-session /usr/local/bin/

---------------------

Requires:

Bash or Zsh

script (preinstalled on Linux/macOS)

pipx

OpenAI CLI

ripgrep

---------------------

🧪 Quick Test

gpt-session start

echo "password = hunter2"

echo "Authorization: Bearer 1234567890"

gpt-session stop

---------------------

Check redactions:

cat ~/.gpt_sessions/<latest>.log.redacted

---------------------

🛠 Development

git clone https://github.com/necr0bot/SentinelShell

cd SentinelShell

./gpt-session --version

---------------------

🔒 Security

SentinelShell never transmits raw logs unless:

gpt-session sync

---------------------

You remain in complete control.

📄 License

MIT License — free for personal + commercial.

---------------------

🗺 Roadmap

macOS auto-installer

pip wrapper for pipx install sentinelshell

brew formula

AUR package

Windows PowerShell version

Multi-language redaction rules

Optional encrypted session storage

Web dashboard for logs

Plugin system

---------------------

🛡 Maintainer

necr0bot
Sentinel of terminals. Hunter of secrets. Friend of AI.

---------------------

⭐ Contributing

See: contributing.md

---------------------

✔ Status

Stable — Ready for daily use.

---------------------
