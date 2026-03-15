# {{{1 General
export EDITOR=vim
# {{{1 History
HISTFILE=$HOME/.zsh-history        # History file
HISTSIZE=10000                     # Number of saved history on memory
SAVEHIST=10000                     # Number of saved history
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_expand
# {{{1 Keybinding
bindkey -e
# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
# {{{1 Alias
# general
alias ls='ls -GF'
alias la='ls -GFAl'
alias ll='ls -GFlh'
# mishiwata1015
alias cddot='cd ~/src/github.com/mishiwata1015/dotfiles'
# git
alias gp='git pull'
alias st='git status'
alias br='git branch'
alias sw='git switch'
alias co='git checkout'
alias di='git diff'
alias rebase='git rebase -i --autosquash'
# lsに色をつける
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# From HomeBrew
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# See: https://github.com/zsh-users/zsh-autosuggestions#configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6E6F70'
# git-promptの読み込み
source /opt/homebrew/etc/bash_completion.d/git-prompt.sh
# git-completionの読み込み
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
zstyle ':completion:*:*:git:*' script /opt/homebrew/etc/bash_completion.d/git-completion.bash
autoload -Uz compinit && compinit
# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%c$ %F{red}$(__git_ps1 "(%s)")%f
\$ '
eval "$(mise activate zsh)"
export PATH="$HOME/.local/bin:$PATH"
export DISABLE_AUTOUPDATER=1
# Load work-specific settings
[[ -f ~/.zshrc.work ]] && source ~/.zshrc.work
