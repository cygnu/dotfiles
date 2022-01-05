# 色の使用
autoload -Uz colors
colors

# 履歴ファイルの保存先
HISTFILE=~/.zsh_history

# メモリに保存される履歴の件数
HISTSIZE=100000

# 履歴ファイルに保存される履歴の件数
SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# ヒストリを呼び出してから実行する間に編集可能
setopt hist_verify

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 補完機能を有効にする
autoload -Uz compinit
compinit

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# alias
alias vi="nvim"
alias vim="nvim"

# Alias that is valid only in the environment where the exa command is installed.
if [[ $(command -v exa) ]]; then
  alias e='exa --icons --git'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons --git'
  alias la=ea
  alias ee='exa -aahl --icons --git'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

# Export a path to nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Export a path to pyenv
eval "$(pyenv init -)"

# Export a path to rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Pass the starship
eval "$(starship init zsh)"
