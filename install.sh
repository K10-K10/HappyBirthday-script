#!/usr/bin/env bash
set -e

REPO_USER="K10-K10"
REPO_NAME="HappyBirthday-script"
BRANCH="main"
# -------------------------------------------------------------

BIN_DIR="$HOME/.local/bin"
SCRIPT_TARGET="$BIN_DIR/birthday"
RAW_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$BRANCH/birthday.sh"

echo "==> Installing Birthday Script..."

mkdir -p "$BIN_DIR"
if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$RAW_URL" -o "$SCRIPT_TARGET"
elif command -v wget >/dev/null 2>&1; then
    wget -qO "$SCRIPT_TARGET" "$RAW_URL"
else
    echo "Error: curl or wget is required." >&2
    exit 1
fi

chmod +x "$SCRIPT_TARGET"

TARGET_RC=""
case "$SHELL" in
    */zsh)
        TARGET_RC="$HOME/.zshrc"
        ;;
    */bash)
        if [ -f "$HOME/.bash_profile" ]; then
            TARGET_RC="$HOME/.bash_profile"
        else
            TARGET_RC="$HOME/.bashrc"
        fi
        ;;
    *)
        TARGET_RC="$HOME/.profile"
        ;;
esac

STARTUP_LINE='[ -t 1 ] && [ -x "$HOME/.local/bin/birthday" ] && "$HOME/.local/bin/birthday"'

if [ -f "$TARGET_RC" ] && grep -Fq "birthday" "$TARGET_RC"; then
    echo "==> Startup hook already exists in $TARGET_RC"
else
    echo "" >> "$TARGET_RC"
    echo "# Birthday startup trigger" >> "$TARGET_RC"
    echo "$STARTUP_LINE" >> "$TARGET_RC"
    echo "==> Added startup hook to $TARGET_RC"
fi

echo "==> Installation complete!"
echo ""

"$SCRIPT_TARGET" --set
