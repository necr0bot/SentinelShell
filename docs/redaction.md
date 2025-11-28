# Redaction System

SentinelShell includes a built-in redaction pipeline designed to protect sensitive data that may appear in your terminal output.  
This ensures that no credentials or secrets are ever sent to the OpenAI API or synced outside your machine.

All redaction happens *before* summaries or sync operations.

---

## What Gets Redacted?

The redaction system targets common secret and credential formats, including:

- password = value
- password: value
- passwd: value
- pwd: value
- secret: value
- token: value
- Authorization: Bearer XXXXX
- api_key=XXXXX
- Any token-like string following `token=`
- Any API key matching typical patterns

These patterns are applied globally using `ripgrep`-compatible substitutions inside the `gpt-session` script.

---

## Output Files

After running a session, SentinelShell produces several files in:

```
~/.gpt_sessions/
```

### Raw log:
```
<timestamp>.log
```

### Timing file:
```
<timestamp>.time
```

### Redacted log:
```
<timestamp>.log.redacted
```

### AI summary (if enabled):
```
<timestamp>.log.summary.md
```

The raw log is **never** sent to the OpenAI API.  
Only the **redacted log** is used for summaries or sync.

---

## Viewing Redacted Logs

You can inspect the redacted output:

```
ls ~/.gpt_sessions
cat ~/.gpt_sessions/<filename>.log.redacted
```

This lets you validate the redaction rules and confirm no secrets remain.

---

## Customizing Redaction

If you want to expand the redaction patterns:

1. Open the `gpt-session` script in a text editor.
2. Locate the redaction section (search for `redact_log()`).
3. Add new `sed` substitution lines following the existing format.

Example addition:

```
s/(aws_access_key_id=)[A-Za-z0-9]+/\1[REDACTED]/g;
```

Advanced users may tailor the pipeline for:

- Cloud credentials
- JWT tokens
- API endpoints
- SSH keys
- Internal hostnames

---

## Why Redaction Matters

Many commands reveal:

- Passwords
- API credentials
- Tokens
- Internal IP addresses
- Sensitive server responses

Redacting ensures:

- Safe AI summarization  
- Safe storage of logs  
- Safe syncing  
- No accidental data leakage  

---

## Known Limitations

SentinelShell attempts to balance **safety** with **practicality**, so:

- Extremely unusual secret formats may not be detected
- Multi-line secrets may require custom rules
- Binary data is not analyzed
- Hyper-specialized secrets (cloud provider tokens) may need manual additions

If you discover a missed pattern, post an issue or send a pull request.

---

This document explains how SentinelShell protects you and how to extend that protection if needed.
