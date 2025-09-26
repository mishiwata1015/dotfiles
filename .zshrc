# {{{1 General
export EDITOR=vim
eval "$(direnv hook zsh)"
# {{{1 Completion
autoload -Uz compinit; compinit -u
# {{{1 History
HISTFILE=$HOME/.zsh-history        # History file
HISTSIZE=10000                     # Number of saved history on memory
SAVEHIST=10000                     # Number of saved history
# ref https://qiita.com/ktr_type23/items/3eb782f98c7a5f4c60b0
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history
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
# Leaner Technologies
alias cdl='cd ~/src/github.com/leaner-co-jp/leaner-procurement/server'
alias railsc='docker compose exec rails bundle exec rails c'
alias rspec='docker compose exec rails bundle exec rspec'
alias rubo='docker compose exec rails bundle exec rubocop -a'
alias rv='sh ~/src/github.com/mishiwata1015/dotfiles/etc/scripts/open-waiting-review-prs.sh'
# git
alias gp='git pull'
alias st='git status'
alias br='git branch'
alias sw='git switch'
alias co='git checkout'
alias di='git diff'
alias rebase='git rebase -i --autosquash'
# {{{1 Keybinding
bindkey -e
# For mysql2 gem
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
# lsに色をつける
compinit
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
# See: https://qiita.com/lichtshinoza/items/ed03f42614ee5605974d
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# From HomeBrew
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# See: https://github.com/zsh-users/zsh-autosuggestions#configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6E6F70'
# See: https://qiita.com/mikan3rd/items/d41a8ca26523f950ea9d
# git-promptの読み込み
source ~/.zsh/git-prompt.sh
# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit
# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%c$ %F{red}$(__git_ps1 "(%s)")%f
\$ '
export GITHUB_PACKAGE_PAT=xxx
eval "$(mise activate zsh)"
source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script
