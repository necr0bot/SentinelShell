# Contributing to SentinelShell

First off — thank you for considering a contribution!  
SentinelShell is an open-source project built to improve the workflow of Linux users, pentesters, CTF players, and power users who want AI-assisted terminal logging.

This document explains how to contribute code, documentation, bug reports, or ideas.

---

# 🚀 How to Contribute

There are several ways to help strengthen SentinelShell:

- Reporting bugs
- Requesting new features
- Improving documentation
- Enhancing redaction filters
- Adding compatibility features
- Improving or extending the shell script
- Submitting pull requests

All contributions are welcome.

---

# 🐞 Reporting Bugs

If you discover a bug:

1. Go to:  
   https://github.com/necr0bot/SentinelShell/issues
2. Click **New Issue**
3. Choose **Bug Report**
4. Include:
   - Description of the bug  
   - How to reproduce it  
   - Expected behavior  
   - Actual behavior  
   - OS version (Kali/Debian/Ubuntu/etc.)  
   - Version of `gpt-session` (`gpt-session --version`)  
   - Relevant log output (redacted)  

Please avoid posting sensitive information — SentinelShell redacts most of it automatically, but double-check before pasting.

---

# 💡 Requesting Features

Feature requests are highly encouraged — SentinelShell is built with users in mind.

A good feature request should include:

- What the feature would do  
- Why it is useful  
- Example workflow  
- Whether it is optional or default  
- Any risks or considerations  

Submit under **Feature Request** on GitHub Issues.

---

# 🛠 Submitting Pull Requests (PRs)

If you want to contribute code:

## 1. Fork the repository

```
https://github.com/necr0bot/SentinelShell/fork
```

## 2. Clone your fork

```
git clone https://github.com/<your-username>/SentinelShell.git
cd SentinelShell
```

## 3. Create a new branch

```
git checkout -b feature/my-new-feature
```

## 4. Make your changes

Please ensure:

- Code is POSIX/Bash-compatible  
- You do not break compatibility with Debian/Kali  
- Autosync still works  
- Redaction still protects sensitive data  
- No personal information is added anywhere  

## 5. Run ShellCheck

Before submitting:

```
shellcheck gpt-session
```

Fix any warnings unless they are intentionally ignored (rare).

## 6. Commit your changes

```
git commit -am "Add: description of change"
```

## 7. Push your branch

```
git push origin feature/my-new-feature
```

## 8. Open a Pull Request

On GitHub, compare your branch → open a PR.

A good PR includes:

- Summary of changes  
- Motivation  
- Any risks or considerations  
- Test steps  

---

# 🧪 Testing Guidelines

When modifying the script, test at minimum:

- `gpt-session start`
- `gpt-session stop`
- `gpt-session --version`
- `gpt-session replay`
- `gpt-session sync`
- Autosync (`autosync-on` and `autosync-off`)
- Redaction for:
  - passwords  
  - tokens  
  - private keys  
  - IP addresses  
- Behavior inside a TryHackMe directory

---

# 🧹 Code Style

SentinelShell follows:

- Clean Bash scripting  
- ShellCheck compliance  
- Readable functions  
- Minimal external dependencies  
- Clear comments, especially around redaction and sync logic  

Please keep the script maintainable and secure.

---

# 🔐 Security Considerations

If you discover a vulnerability (especially redaction bypass), **do not** open a public issue.

Instead, contact the maintainer privately.

---

# ❤️ Thank You

Every contribution — from typos to major features — helps SentinelShell grow.

Your efforts make the tool better for thousands of users.
