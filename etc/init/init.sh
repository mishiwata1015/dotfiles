#!/bin/bash

# Utilities
is_exists() {
  command -v "$1" > /dev/null 2>&1
  return $?
}

# Brew
if ! is_exists "brew"; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle --verbose --file="$DOTFILES_ROOT/etc/init/Brewfile"
