<p align="center">
  <img src="screenshots/sentinelshell_banner.png" alt="SentinelShell Banner" width="900">
</p>

---

# SentinelShell  
**AI-Powered Terminal Session Logging, Redaction, and Summaries**

![License](https://img.shields.io/badge/License-MIT-green.svg)
![Shell](https://img.shields.io/badge/Shell-Bash-blue)
![Status](https://img.shields.io/badge/Status-Alpha-orange)
![OpenAI](https://img.shields.io/badge/AI-OpenAI-yellow)

---

## 🛡️ What is SentinelShell?

SentinelShell is a **terminal sidekick** that records your sessions, scrubs secrets, and uses OpenAI to summarize what you did.

It is designed for:

- 🧑‍💻 Pentesters & red-teamers  
- 🎯 CTF / TryHackMe / HackTheBox players  
- 🎓 Learners who want searchable logs and summaries  
- 🧪 Anyone who wants ChatGPT-awareness of their terminal work

---

## ✨ Features

- 📼 **Full session logging** using `script`
- 🧼 **Redaction pipeline** for passwords, tokens, API keys, bearer tokens, etc.
- 🤖 **AI summaries** via the OpenAI CLI
- 🔁 **Replay** sessions with `scriptreplay`
- ☁️ **Sync command** to send logs to ChatGPT for deeper analysis
- ⏱ **Autosync** every N minutes (optional)
- 📄 **Profile file** to give ChatGPT your habits/context

---

## 📦 Installation

> Requires: Linux (or WSL), Bash/Zsh, `script`, `pipx`, OpenAI CLI, and `ripgrep`.

### 1. Clone the repo

```bash
git clone https://github.com/necr0bot/SentinelShell.git
cd SentinelShell
```

### 2. Install dependencies and script

```bash
chmod +x install.sh
./install.sh
```
This will:

    Ensure pipx is installed

    Install/upgrade the OpenAI CLI via pipx

    Install ripgrep

    Install gpt-session into /usr/local/bin

### 3. Set your OpenAI API key

```bash
export OPENAI_API_KEY="sk-xxxx"
echo 'export OPENAI_API_KEY="sk-xxxx"' >> ~/.zshrc   # or ~/.bashrc
```
Don't be a dumb dumb and just copypasta. Actually set your API key here.

---

🚀 Basic Usage
Start a session

```bash
gpt-session start
```

Use your terminal as normal. Everything is being recorded.
Stop and summarize

```bash
gpt-session stop
```

This will:

  Stop logging

  Run the redaction pipeline

  Call the OpenAI CLI to generate a summary (if API key is set)

  # SentinelShell  
**AI-Powered Terminal Session Logging, Redaction, and Summaries**

![License](https://img.shields.io/badge/License-MIT-green.svg)
![Shell](https://img.shields.io/badge/Shell-Bash-blue)
![Status](https://img.shields.io/badge/Status-Alpha-orange)
![OpenAI](https://img.shields.io/badge/AI-OpenAI-yellow)

---

## 🛡️ What is SentinelShell?

SentinelShell is a **terminal sidekick** that records your sessions, scrubs secrets, and uses OpenAI to summarize what you did.

It is designed for:

- 🧑‍💻 Pentesters & red-teamers  
- 🎯 CTF / TryHackMe / HackTheBox players  
- 🎓 Learners who want searchable logs and summaries  
- 🧪 Anyone who wants ChatGPT-awareness of their terminal work

---

## ✨ Features

- 📼 **Full session logging** using `script`
- 🧼 **Redaction pipeline** for passwords, tokens, API keys, bearer tokens, etc.
- 🤖 **AI summaries** via the OpenAI CLI
- 🔁 **Replay** sessions with `scriptreplay`
- ☁️ **Sync command** to send logs to ChatGPT for deeper analysis
- ⏱ **Autosync** every N minutes (optional)
- 📄 **Profile file** to give ChatGPT your habits/context

---

## 📦 Installation

> Requires: Linux (or WSL), Bash/Zsh, `script`, `pipx`, OpenAI CLI, and `ripgrep`.

### 1. Clone the repo

```bash
git clone https://github.com/necr0bot/SentinelShell.git
cd SentinelShell
```

### 2. Install dependencies and script

chmod +x install.sh
./install.sh

This will:

    Ensure pipx is installed

    Install/upgrade the OpenAI CLI via pipx

    Install ripgrep

    Install gpt-session into /usr/local/bin

3. Set your OpenAI API key

export OPENAI_API_KEY="sk-xxxx"
echo 'export OPENAI_API_KEY="sk-xxxx"' >> ~/.zshrc   # or ~/.bashrc

🚀 Basic Usage
Start a session

gpt-session start

Use your terminal as normal. Everything is being recorded.
Stop and summarize

gpt-session stop

This will:

    Stop logging

    Run the redaction pipeline

    Call the OpenAI CLI to generate a summary (if API key is set)

    Save summary to ~/.gpt_sessions/<session>.log.summary.md

Replay the last session

gpt-session replay

Generate/update your profile

gpt-session profile

This writes a profile/context file to:

~/.gpt_sessions/profile.txt

You can paste this into ChatGPT before asking for help about your logs.
Sync a session manually

gpt-session sync

Optionally uses openai CLI to send the log contents for analysis.
Enable autosync (every N minutes)

gpt-session autosync-on 30   # every 30 minutes
gpt-session autosync-off     # disable autosync

Check version

gpt-session --version

🧼 Redaction

Before any log is used for summary/sync, SentinelShell passes it through a redaction filter to remove:

    password = ...

    passwd: ...

    secret: ...

    token: ...

    Authorization: Bearer ...

    api_key=...

You can see the redacted log in:

ls ~/.gpt_sessions
cat ~/.gpt_sessions/<latest>.log.redacted

📚 Docs

See the docs/ folder for:

    installation.md — detailed install steps

    usage.md — examples and workflows

    redaction.md — how secrets are scrubbed

    autosync.md — how autosync works

    profile.md — how to structure your ChatGPT profile

    architecture.md — how it’s put together internally

🧪 Development

Run from local checkout:

./gpt-session --version

ShellCheck (recommended):

shellcheck gpt-session

🤝 Contributing

Issues and PRs are welcome.

See: contributing.md
📝 Changelog

See: changelog.md
📄 License

MIT License.
Copyright (c) 2025
🗺 Roadmap

    macOS installer support

    pipx-installable Python wrapper

    brew formula

    AUR package

    More flexible redaction patterns

    Optional encryption for logs

    Simple web UI to browse logs

👤 Maintainer

@necr0bot


Cybersecurity enjoyer. CTF grinder. Terminal goblin.

---
