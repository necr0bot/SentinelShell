# Installation

## Requirements

- Linux (or WSL)
- Bash or Zsh
- `script` (usually from `bsdutils` or util-linux)
- `pipx`
- OpenAI CLI
- `ripgrep`

## Steps

```bash
git clone https://github.com/necr0bot/SentinelShell.git
cd SentinelShell
chmod +x install.sh
./install.sh
```

Then export your OpenAI API key:

```bash
export OPENAI_API_KEY="sk-xxxx"
echo 'export OPENAI_API_KEY="sk-xxxx"' >> ~/.zshrc
```
*You need to modify the above to insert your API key*
