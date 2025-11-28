# SentinelShell Architecture

This document provides a high-level overview of how SentinelShell works internally.  
It explains the major components, directories, processes, and data flow that power logging, redaction, summarization, syncing, and profile creation.

---

# Overview

SentinelShell is built around a single Bash script: `gpt-session`.

It combines:

- The `script` utility for capturing terminal I/O
- A custom redaction pipeline (sed + ripgrep regex)
- The OpenAI CLI for generating summaries and syncing
- Simple file-based state tracking (PID files, interval files)
- Standard UNIX process management

No external daemons, no heavy dependencies, and no persistent background services unless autosync is enabled.

---

# Components

SentinelShell consists of the following parts:

## 1. The gpt-session Script

Located at:

```
/usr/local/bin/gpt-session
```

This is the core of SentinelShell.  
It contains logic for:

- Starting terminal recordings
- Stopping and finalizing sessions
- Redacting sensitive data
- Generating summaries with OpenAI
- Syncing logs
- Autosync background operation
- Profile creation
- Version display

The script is self-contained and uses POSIX-compatible shell commands whenever possible.

---

## 2. The ~/.gpt_sessions Directory

All session data is stored in:

```
~/.gpt_sessions/
```

This directory holds:

- Raw logs (`*.log`)
- Timing files (`*.time`)
- Redacted logs (`*.log.redacted`)
- Summaries (`*.log.summary.md`)
- Profile (`profile.txt`)
- Autosync PID/interval files

This keeps user data separate from the installation.

---

## 3. Session Logging (script)

SentinelShell uses the standard Linux tool:

```
script
```

to record all terminal input/output in a TTY-safe format.

Two files are produced for each session:

1. `<timestamp>.log`  
2. `<timestamp>.time`

These allow accurate replay using:

```
scriptreplay <log> <time>
```

---

## 4. Redaction Engine

Before any summary or sync occurs, logs pass through a redaction pipeline.

This uses `sed`/regex rules to scrub:

- passwords  
- tokens  
- secrets  
- API keys  
- Authorization: Bearer headers  
- common secret variable formats  

Redaction is designed to be easily extendable by modifying the `gpt-session` script.

---

## 5. AI Summary Provider (OpenAI CLI)

Summaries are generated using:

```
openai api chat.completions.create
```

The redacted log is fed to the OpenAI CLI, which returns a markdown summary.  
This is saved as:

```
<timestamp>.log.summary.md
```

This requires the environment variable:

```
OPENAI_API_KEY
```

to be set.

---

## 6. Sync Logic

Syncing refers to sending your **redacted** session log to OpenAI for extended analysis or archiving.

Command:

```
gpt-session sync
```

This:

1. Redacts the file fresh  
2. Calls the OpenAI CLI on the redacted version  
3. Writes the AI output to a summary file  

Sync never uses the raw log.

---

## 7. Autosync Background Loop

Autosync creates a background process that periodically triggers:

```
gpt-session sync
```

It stores its state in:

```
~/.gpt_sessions/autosync.pid
~/.gpt_sessions/autosync.interval
```

Autosync runs until:

```
gpt-session autosync-off
```

is called.

---

## 8. Profile System

Command:

```
gpt-session profile
```

writes a personalized context file to:

```
~/.gpt_sessions/profile.txt
```

This file can be pasted into ChatGPT to improve log analysis.

---

## 9. File Permissions and Installation

The script is installed to:

```
/usr/local/bin/gpt-session
```

via the provided installer:

```
install.sh
```

This ensures:

- Executable permissions
- System-wide availability
- Compatibility with both Bash and Zsh environments

---

# Data Flow Summary

Below is the typical flow during a session:

```
┌────────────────────┐
│ gpt-session start  │
└───────┬────────────┘
        │ Launch "script"
        ▼
┌──────────────────────────┐
│ Terminal session running │
└───────┬──────────────────┘
        │ Do your thing...
        | then
        | User stops session
        ▼
┌────────────────────┐
│ gpt-session stop   │
├────────────────────┤
│ Redaction pipeline │
│ OpenAI summary     │
│ Save artifacts     │
└────────────────────┘
```

Autosync extends this by inserting periodic syncs.

---

# Design Goals

SentinelShell is built around the following principles:

- **Fail-safe**: If OpenAI CLI fails, the session logs remain intact.
- **Privacy-first**: Only redacted logs are ever sent externally.
- **Minimal dependencies**: Works on any Linux or macOS system with Bash/Zsh.
- **Transparent**: Logs are plain text; no binary or proprietary formats.
- **Extendable**: Users can modify redaction patterns or add new commands.

---

# Future Architecture Enhancements

Planned future improvements:

- Optional encrypted storage for raw and redacted logs
- pluggable redaction modules (Python/Perl/Bash)
- Structured JSON session summaries
- Integration with web UI for browsing logs
- Support for multi-session navigation
- Windows PowerShell port

---

This document describes the internal structure and processes that make SentinelShell work.

