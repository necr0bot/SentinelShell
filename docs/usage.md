# Usage Guide

This document explains how to use SentinelShell’s core commands, how session logging works, and where files are stored.

---

## Starting a Session

Begin a terminal logging session:

```
gpt-session start
```

While active, all terminal input/output is recorded using the `script` utility.

You can use your terminal normally during this time.

---

## Stopping a Session

To stop logging and generate summaries/redactions:

```
gpt-session stop
```

This performs several actions:

1. Stops the `script` session
2. Saves the raw log to `~/.gpt_sessions/<timestamp>.log`
3. Saves timing data to `~/.gpt_sessions/<timestamp>.time`
4. Applies the redaction filter to produce:
   - `<timestamp>.log.redacted`
5. Uses OpenAI (if configured) to produce:
   - `<timestamp>.log.summary.md`

---

## Replaying a Session

Replay a recorded session with timing preserved:

```
gpt-session replay
```

This uses:

- `scriptreplay <log> <time>`

to reproduce the session exactly as it happened.

---

## Generating a Profile

Create or update your ChatGPT profile file:

```
gpt-session profile
```

This writes a file to:

```
~/.gpt_sessions/profile.txt
```

You can paste this file into ChatGPT for better context when analyzing sessions.

---

## Syncing Session Logs

To manually sync the **redacted log** to the OpenAI API:

```
gpt-session sync
```

This uses the OpenAI CLI to upload the redacted log or send it for further summarization or transformation.  
Requires:

```
export OPENAI_API_KEY="sk-xxxx"
```

---

## Autosync Mode

Enable autosync every N minutes:

```
gpt-session autosync-on 30
```

This runs a background loop that calls:

```
gpt-session sync
```

every 30 minutes (or any number you specify).

Disable autosync:

```
gpt-session autosync-off
```

---

## Viewing Redacted Logs

View all session logs:

```
ls ~/.gpt_sessions
```

View a specific redacted log:

```
cat ~/.gpt_sessions/<name>.log.redacted
```

---

## Checking Version

```
gpt-session --version
```

If added, prints something like:

```
gpt-session 0.1.0
```

---

## Clearing Logs

Remove everything:

```
rm -r ~/.gpt_sessions
```

(Do this only if you no longer want your session history.)

---

This concludes the basic usage instructions for SentinelShell.
