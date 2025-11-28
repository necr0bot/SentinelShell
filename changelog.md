# Changelog

# Changelog
All notable changes to **SentinelShell** will be documented in this file.

This project follows **Semantic Versioning** (https://semver.org/).

---

## [0.1.0] – 2025-11-28
### Added
- Initial public release of SentinelShell.
- Full session logging using the `script` utility.
- Automatic AI-powered session summaries (OpenAI API).
- Redaction engine:
  - passwords / secrets / tokens
  - Bearer tokens
  - API keys (`OPENAI_API_KEY`, `api_key=`)
  - IPv4 addresses
  - PEM private keys
- Replay support with timing files (`scriptreplay`).
- TryHackMe-style project detection (extract room name).
- Profile system (`~/.gpt_sessions/profile.txt`) with user preferences.
- Manual sync to ChatGPT using the OpenAI CLI.
- Autosync service:
  - background PID manager
  - quiet, redacted sync loop
- Installer script (`install.sh`).
- Man page (`man/gpt-session.1`).
- Documentation in `/docs`:
  - installation
  - usage
  - redaction
  - autosync
  - profile
  - architecture
- ShellCheck GitHub Actions workflow.
- Neon banner and branding assets.

---

## [Unreleased]
### Planned / Roadmap
- macOS support.
- Multiple profile support.
- Optional encryption of stored logs.
- Local-only summary mode with offline model.
- Plugin architecture for tools like nmap, ffuf, gobuster.
- Structured JSON summary output.
- VSCode extension integration.
