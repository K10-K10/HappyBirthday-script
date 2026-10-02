# Happy Birthday Script

A simple bash script that will send you a birthday message on your birthday. It will also send you a message if you have not set your birthday yet.

# Installation

```bash
curl -fsSL [https://raw.githubusercontent.com/your-username/birthday-cli/main/install.sh](https://raw.githubusercontent.com/your-username/birthday-cli/main/install.sh) | bash
```

# Usage

Wait until your birthday!

# Uninstallation

Remove the script and its associated files by running the following commands:
```bash
rm -f ~/.local/bin/birthday
rm -rf ~/.local/share/birthday
```

Also, remove the line added to your `.bashrc` file by the installation script. You can do this by opening your `.bashrc` file in a text editor and deleting the line that was added.

```bash
# Birthday startup trigger
[ -t 1 ] && [ -x "$HOME/.local/bin/birthday" ] && "$HOME/.local/bin/birthday"
```

# Resetting Your Birthday

```bash
~/.local/bin/birthday --set
```

## Description `install.sh`

This script will download the `happyBirthday.sh` script and place it in your home directory, and add command to your `.bashrc` file so that it runs every time you open a new terminal window.
