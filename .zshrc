# {{{1 General
export EDITOR=vim

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

# qiita
alias cdq='cd ~/src/github.com/increments/Qiita'
alias codeq='code ~/.myapp/vscode/qiita.code-workspace'
alias re='~/src/github.com/increments/Qiita/bin/redeem exec'
alias railsc='~/src/github.com/increments/Qiita/bin/redeem exec spring rails c'
alias railsg='~/src/github.com/increments/Qiita/bin/redeem exec spring rails g'
alias railsr='~/src/github.com/increments/Qiita/bin/redeem exec spring rails r'
alias rspec='~/src/github.com/increments/Qiita/bin/redeem exec spring rspec'
alias db:migrate='~/src/github.com/increments/Qiita/bin/redeem exec spring rails db:migrate'
alias db:reset='~/src/github.com/increments/Qiita/bin/redeem exec spring rails db:reset'
alias db:rollback='~/src/github.com/increments/Qiita/bin/redeem exec spring rails db:rollback'
alias db:migrate:status='~/src/github.com/increments/Qiita/bin/redeem exec spring rails db:migrate:status'

# git
alias gp='git pull'
alias st='git status'
alias br='git branch'
alias co='git checkout'
alias di='git diff'
alias rebase='git rebase -i --autosquash'

# {{{1 prompt
PROMPT='%m:%c %n$ '

# {{{1 Keybinding
bindkey -e

# rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# lsに色をつける
compinit

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
