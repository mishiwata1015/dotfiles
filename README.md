# dotfiles
My dotfiles.

## Installation

Before running, install Xcode Command Line Tools and make sure your SSH key is set up for GitHub.

```bash
$ xcode-select --install
```

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/mishiwata1015/dotfiles/main/etc/install)"
```

For work Mac, also run:

```bash
$ brew bundle --file=~/src/github.com/mishiwata1015/dotfiles/etc/init/Brewfile.work
```
