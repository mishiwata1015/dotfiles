#!/bin/bash

# Brew
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle --verbose --file="$DOTFILES_ROOT/etc/init/Brewfile"
# For work Mac, also run:
# brew bundle --file="$DOTFILES_ROOT/etc/init/Brewfile.work"

# vscode
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User
mkdir -p "${VSCODE_SETTING_DIR}"

ln -sfn "$DOTFILES_ROOT/.myapp/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"
ln -sfn "$DOTFILES_ROOT/.myapp/vscode/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

while IFS= read -r line || [[ -n "$line" ]]; do
  [[ -z "$line" ]] && continue
  code --install-extension "$line"
done < "$DOTFILES_ROOT/.myapp/vscode/extensions.txt"
