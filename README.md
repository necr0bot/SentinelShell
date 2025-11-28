# SentinelShell

<p align="center">
  <img src="https://raw.githubusercontent.com/necr0bot/SentinelShell/main/screenshots/sentinelshell_banner_neon.png" alt="SentinelShell Banner">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-green.svg">
  <img src="https://img.shields.io/badge/Shell-Bash-blue">
  <img src="https://img.shields.io/badge/Status-Alpha-orange">
  <img src="https://img.shields.io/badge/AI-OpenAI-yellow">
  
  <br>

  <img src="https://img.shields.io/github/v/release/necr0bot/SentinelShell?color=blue&label=Release">
  <img src="https://img.shields.io/github/stars/necr0bot/SentinelShell?color=gold">
  <img src="https://img.shields.io/github/issues/necr0bot/SentinelShell?color=red">
  <img src="https://img.shields.io/github/last-commit/necr0bot/SentinelShell?color=purple">
  <img src="https://img.shields.io/github/actions/workflow/status/necr0bot/SentinelShell/shellcheck.yml?label=ShellCheck">
</p>

---

# Overview

SentinelShell is an AI-powered terminal assistant that automatically logs your sessions, summarizes them, redacts secrets, replays activity, and optionally syncs context back to ChatGPT.

It is designed for:

- CTF players  
- Penetration testers  
- Linux power users  
- Researchers  
- Productivity hackers  

You stay in control — the AI just helps.

---

# Features

### AI Session Summaries
Automatically generate summaries detailing commands, errors, progress, and next steps.

### Sensitive Data Redaction
Redacts:
- passwords  
- tokens  
- API keys  
- bearer tokens  
- IP addresses  
- private keys  

Before anything is synced.

### Session Replay  
Replay your terminal exactly as it happened.

### Autosync  
Background sync to ChatGPT every N minutes.

### Project Detection  
Auto-detects TryHackMe/HTB-style folders like:

```
~/thm/<room>/
```

### Profile System  
Customizable preferences stored in:

```
~/.gpt_sessions/profile.txt
```

---

# Installation

Clone:

```
git clone https://github.com/necr0bot/SentinelShell.git
cd SentinelShell
```

Install:

```
sudo bash install.sh
```

This installs:
- /usr/local/bin/gpt-session  
- man page  
- ~/.gpt_sessions/  

---

# Usage

Start logging:

```
gpt-session start
```

Stop logging:

```
gpt-session stop
```

Replay:

```
gpt-session replay
```

Status:

```
gpt-session status
```

---

# Redaction

The redaction pipeline replaces:

```
password = xyz      → password = [REDACTED]
Authorization: Bearer abc → Authorization: Bearer [REDACTED]
OPENAI_API_KEY=xxxx → OPENAI_API_KEY=[REDACTED]
IP addresses        → [REDACTED_IP]
Private keys        → [REDACTED]
```

See full documentation in `docs/redaction.md`.

---

# Autosync

Enable autosync:

```
gpt-session autosync-on 30
```

Disable:

```
gpt-session autosync-off
```

Status:

```
gpt-session autosync-status
```

---

# Profile System

Initialize profile:

```
gpt-session profile
```

Edit:

```
nano ~/.gpt_sessions/profile.txt
```

---

# Documentation

Found in `/docs`:

- installation.md  
- usage.md  
- redaction.md  
- autosync.md  
- profile.md  
- architecture.md  

---

# Architecture

See `/docs/architecture.md` for:

- session management  
- timing files  
- redaction  
- autosync loop  
- OpenAI integration  

---

# Roadmap

### v0.2.0  
- Uninstaller  
- Multiple profiles  
- MacOS support  
- Enhanced replay formatting  

### v1.0  
- Plugin system  
- Local encryption  
- Command insights engine  

---

# Contributing

Pull requests welcome!  
See `contributing.md`.

---

# License

MIT License.

---

# FAQ

**Is anything uploaded automatically?**  
No. Sync only occurs when you ask for it or enable autosync.

**Does it leak secrets?**  
No — redaction removes them before any sync.

**Does it modify my shell?**  
No. It only wraps `script`, `sed`, and the OpenAI CLI.

**Does it work without OpenAI installed?**  
Yes — logging and replay still work. Summaries and autosync won't.

---

# SentinelShell  
Your AI terminal copilot — safe, local, hacker-friendly.
