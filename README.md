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

Then create `.zshrc.work` and `.zshenv` based on the samples and fill in your actual values.
Both files are gitignored because they contain credentials.

- `.zshrc.work`: interactive-only settings (aliases, direnv hook, etc.)
- `.zshenv`: environment variables that non-interactive shells also need (e.g. `GITHUB_PACKAGE_PAT`)

```bash
$ cd ~/src/github.com/mishiwata1015/dotfiles
$ cp .zshrc.work.sample .zshrc.work
$ cp .zshenv.sample .zshenv
# Edit .zshrc.work and .zshenv with your actual values
$ ln -sfn "$PWD/.zshrc.work" ~/.zshrc.work
$ ln -sfn "$PWD/.zshenv" ~/.zshenv
```
