#!/usr/bin/env bash

DATA_DIR="$HOME/.local/share/birthday"
BIRTH_PATH="$DATA_DIR/date.txt"
LOCK_PATH="$DATA_DIR/lock.txt"

if [ "$1" == "--set" ]; then
    echo -n "Please enter your birthday in the format DD-MM (e.g. 25-12): "
    read -r BIRTHDAY
    mkdir -p "$DATA_DIR"
    echo "$BIRTHDAY" > "$BIRTH_PATH"
    echo "Your birthday has been set to $BIRTHDAY."
    echo "Waiting for your birthday!"
    exit 0
fi

if [ ! -f "$BIRTH_PATH" ]; then
    exit 0
fi

TODAY=$(date +%d-%m)
BIRTHDAY=$(cat "$BIRTH_PATH")

if [ "$TODAY" == "$BIRTHDAY" ]; then
    if [ ! -f "$LOCK_PATH" ]; then
        cat << 'EOF'
        *       *       *       *       *
      .-'-.   .-'-.   .-'-.   .-'-.   .-'-.
      |   |   |   |   |   |   |   |   |   |
    .-'---'-.-'---'-.-'---'-.-'---'-.-'---'-.
   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   | :*: :*: :*:  HAPPY BIRTHDAY!  :*: :*: :*|
   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   |                                         |
   |_________________________________________|
EOF
        touch "$LOCK_PATH"
    fi
else
    rm -f "$LOCK_PATH"
fi
