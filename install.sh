#!/bin/bash
#
# SentinelShell Installer
# Installs the `gpt-session` utility and supporting files.
#

set -e

INSTALL_DIR="/usr/local/bin"
MAN_DIR="/usr/local/share/man/man1"
SESS_DIR="$HOME/.gpt_sessions"
SCRIPT_NAME="gpt-session"
MANPAGE="man/gpt-session.1"

echo "[+] SentinelShell Installer"
echo "[+] Installing gpt-session…"

#############################################
# Ensure required directories exist
#############################################
mkdir -p "$INSTALL_DIR"
mkdir -p "$MAN_DIR"
mkdir -p "$SESS_DIR"

#############################################
# Install script
#############################################
if [ ! -f "./$SCRIPT_NAME" ]; then
    echo "[-] Error: $SCRIPT_NAME not found in current directory."
    echo "    Run this installer from the SentinelShell root folder."
    exit 1
fi

echo "[+] Copying $SCRIPT_NAME → $INSTALL_DIR"
sudo cp "./$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

#############################################
# Install manpage
#############################################
if [ -f "$MANPAGE" ]; then
    echo "[+] Installing manpage → $MAN_DIR"
    sudo cp "$MANPAGE" "$MAN_DIR/gpt-session.1"
    sudo gzip -f "$MAN_DIR/gpt-session.1"
else
    echo "[!] Warning: Manpage not found. Skipping."
fi

#############################################
# Preserve profile if exists
#############################################
PROFILE_FILE="$SESS_DIR/profile.txt"

if [ ! -f "$PROFILE_FILE" ]; then
    echo "[+] Creating empty user profile: $PROFILE_FILE"
    cat > "$PROFILE_FILE" << 'EOF'
# SentinelShell Profile
# Add preferences here (this file is synced with GPT during session logs).
EOF
else
    echo "[+] Existing profile detected. Leaving unchanged."
fi

#############################################
# Final instructions
#############################################
echo ""
echo "[+] Installation complete!"
echo "[+] You can now run:"
echo ""
echo "    gpt-session --version"
echo "    gpt-session start"
echo "    gpt-session profile"
echo ""
echo "[+] Man page available via:"
echo "    man gpt-session"
echo ""
echo "[✓] SentinelShell is ready."
