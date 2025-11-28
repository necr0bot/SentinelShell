# SentinelShell  
AI-Augmented Terminal Logging for Pentesters

![logo](screenshots/logo.png)

---

## 🛡️ What is SentinelShell?

**SentinelShell** brings AI directly into your Linux terminal workflow.

It automatically:

- 📜 **Records your entire terminal session**
- 🔐 **Redacts sensitive data** (passwords, API keys, tokens, IPs)
- 🧠 **Generates AI summaries** after each session
- 🔁 **Replays everything** using `scriptreplay`
- ☁️ **Syncs logs to ChatGPT** via the OpenAI CLI
- 🧭 **Understands TryHackMe / HTB / CTF workflows**
- 💡 Provides **contextual hints** when you ask for help

Perfect for:

- Pentesters  
- Red-team operators  
- Bug bounty hunters  
- CTF players  
- Cybersecurity students  
- Anyone who wants ChatGPT *inside the terminal*

---

## ✨ Features

- Full terminal session logging (`script`)
- Automatic redaction of secrets
- AI-powered summaries via OpenAI CLI
- Autosync every N minutes
- Manual sync option
- Session replay
- Profile persistence
- THM room detection
- Zero dependencies — pure Bash

---

## 🏁 Quickstart

### 1. Install the OpenAI CLI
```bash
pipx install openai
pipx ensurepath
````

### 2. Install SentinelShell

```bash
chmod +x install.sh
sudo ./install.sh
```

### 3. Configure API Key

```bash
export OPENAI_API_KEY="sk-xxxx"
echo 'export OPENAI_API_KEY="sk-xxxx"' >> ~/.zshrc
```

### 4. Start a session

```bash
gpt-session start
```

### 5. Stop + summarize

```bash
gpt-session stop
```

### 6. Replay

```bash
gpt-session replay
```

### 7. Sync manually

```bash
gpt-session sync
```

### 8. Enable autosync (every 30 min)

```bash
gpt-session autosync-on 30
```

---

## 📦 File Structure

```
SentinelShell/
├── gpt-session
├── install.sh
├── README.md
├── LICENSE
├── changelog.md
├── contributing.md
├── docs/
│   └── index.md
├── man/
│   └── gpt-session.1
└── screenshots/
    └── logo.png
```

---

## 📚 Documentation

GitHub Pages (auto-generated):

👉 [https://necr0bot.github.io/SentinelShell](https://necr0bot.github.io/SentinelShell)

---

## 🎮 Example Workflow

```bash
$ gpt-session start
[+] Session recording started...

$ nmap -sC -sV 10.10.10.10
# ... scanning output ...

$ gobuster dir -u http://10.10.10.10 -w /usr/share/wordlists/...
# ... enumeration output ...

$ gpt-session stop
[+] Session saved.
[+] Generating summary with OpenAI...
[+] Summary written to: general_20250101-123455.log.summary.md
```

---

## 🎨 Badges

![License](https://img.shields.io/badge/License-MIT-green.svg)
![Shell](https://img.shields.io/badge/Bash-Script-blue)
![OpenAI](https://img.shields.io/badge/AI-OpenAI-yellow)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

---

## 🛠️ Development

### Run from local copy:

```bash
./gpt-session start
```

### Install from local copy:

```bash
sudo install -m755 gpt-session /usr/local/bin/
```

---

## 🤝 Contributing

PRs welcome!

See: [CONTRIBUTING.md](contributing.md)

---

## 📝 Changelog

See: [CHANGELOG.md](changelog.md)

---

## 📜 License

MIT License
Copyright (c) 2025

---

## ❤️ Support

If you like SentinelShell, please:

* ⭐ Star the repository
* 🗣️ Share it
* 🐛 Report issues
* 🔧 Submit PRs

---
