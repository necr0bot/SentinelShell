# Installation Guide

This document describes how to install SentinelShell on Linux, Kali, Ubuntu, Arch, or macOS (with partial support).

---

## Requirements

To run SentinelShell you need:

- Bash or Zsh
- The `script` utility (comes standard on Linux)
- `pipx` (Python isolated app runner)
- OpenAI CLI (`pipx install openai`)
- `ripgrep` (`rg`)

The installer script will attempt to install or verify most of these automatically.

---

## Repository Setup

Clone SentinelShell from GitHub:

```
git clone https://github.com/necr0bot/SentinelShell.git
cd SentinelShell
```

---

## Running the Installer

Run the installer script:

```
chmod +x install.sh
./install.sh
```

The installer will:

- Detect your package manager (`apt`, `pacman`, or `brew`)
- Install missing dependencies where possible
- Install `pipx` if missing
- Install or update the OpenAI CLI
- Install `ripgrep` if missing
- Create the `~/.gpt_sessions` directory
- Copy `gpt-session` into `/usr/local/bin/`

---

## Setting Your OpenAI API Key

You must export your API key for summaries and sync logic:

```
export OPENAI_API_KEY="sk-xxxx"
```

To make it persistent:

```
echo 'export OPENAI_API_KEY="sk-xxxx"' >> ~/.zshrc
# or:
echo 'export OPENAI_API_KEY="sk-xxxx"' >> ~/.bashrc
```

Replace `sk-xxxx` with your actual key.

---

## Testing Your Installation

Run:

```
gpt-session start
echo "test"
gpt-session stop
```

You should see:

- A raw log file
- A redacted log file
- A summary file (if API key is set)

---

## Troubleshooting

### OpenAI CLI not found

Ensure `pipx` is in your PATH:

```
pipx ensurepath
source ~/.zshrc   # or ~/.bashrc
```

Then reinstall:

```
pipx install openai --force
```

### ripgrep not installed

Install manually:

```
sudo apt install ripgrep
```

or

```
sudo pacman -S ripgrep
```

or

```
brew install ripgrep
```

---

SentinelShell should now be installed and ready to use.

---

## Uninstalling SentinelShell

Remove the script:

```
sudo rm /usr/local/bin/gpt-session
```

Optional: remove session logs:

```
rm -r ~/.gpt_sessions
```

---
