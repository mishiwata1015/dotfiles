#!/bin/bash

# Utilities
is_exists() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

# Brew
if ! is_exists "brew"; then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew upgrade
brew bundle --verbose --file="$DOTFILES_ROOT/etc/init/Brewfile"

# vscode
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$DOTFILES_ROOT/.myapp/vscode/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$DOTFILES_ROOT/.myapp/vscode/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

cat "$DOTFILES_ROOT/.myapp/vscode/extensions.txt" | while read line
do
 code --install-extension $line
done
