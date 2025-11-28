### `docs/redaction.md`

```md
# Redaction

SentinelShell tries to avoid leaking secrets by applying a redaction filter before logs are summarized or synced.

Patterns include:

- `password = ...`
- `passwd: ...`
- `secret: ...`
- `token: ...`
- `Authorization: Bearer ...`
- `api_key=...`

The redacted output is written alongside the raw log, typically as:

```text
~/.gpt_sessions/<session>.log.redacted
```
You can customize patterns by editing the redaction function in gpt-session.
