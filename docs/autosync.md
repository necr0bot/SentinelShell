# Autosync Guide

Autosync is an optional SentinelShell feature that periodically sends the **redacted session log** to the OpenAI API for summarization or analysis.  
This can be useful during long CTF or pentest sessions where you want continuous updates or a running log of your progress.

Autosync never uses the raw log — only the redacted version.

---

## Enabling Autosync

To enable autosync, specify an interval in minutes:

```
gpt-session autosync-on 30
```

This creates a background loop that runs indefinitely until you stop it.

The loop will:

1. Check for the latest redacted log
2. Call `gpt-session sync`
3. Sleep for N minutes
4. Repeat

Autosync will immediately exit if `OPENAI_API_KEY` is not set.

---

## Disabling Autosync

Stop the autosync background job:

```
gpt-session autosync-off
```

This command:

- Locates the autosync PID file  
- Terminates the associated background process  
- Removes the autosync marker file  

After this, autosync will no longer run until re-enabled.

---

## Where Autosync Stores Its State

Autosync uses two very small tracking files in:

```
~/.gpt_sessions/
```

These usually look like:

```
autosync.pid
autosync.interval
```

They store:

- The process ID (so it can be stopped later)
- The interval in minutes

You typically do not need to touch these files manually.

---

## Manual Sync

Even with autosync enabled, you can manually sync at any time:

```
gpt-session sync
```

This will immediately:

- Redact the log (fresh pass)
- Upload it via the OpenAI CLI
- Save a new summary if configured

---

## Requirements for Autosync

Autosync requires:

- A valid `OPENAI_API_KEY`
- OpenAI CLI installed
- Redactions working correctly
- A writable `~/.gpt_sessions/` directory

If any of these fail, autosync safely exits.

---

## Checking Autosync Status

If you're unsure whether autosync is active, check:

```
ps aux | grep gpt-session
```

or inspect for this file:

```
~/.gpt_sessions/autosync.pid
```

If the PID file exists and the process is running, autosync is active.

---

## Notes and Recommendations

- Autosync is optional — you can ignore it entirely if you prefer manual workflows.
- Autosync never touches the raw log.
- Autosync will not spawn duplicate processes if you run it multiple times; it checks state.
- Autosync won't run while a session is actively recording; summaries are only generated after `gpt-session stop`.

---

This document explains how to safely use, enable, disable, and monitor autosync within SentinelShell.

