eval source <(/usr/local/bin/starship init zsh --print-full-init)

if [[ $(command -v exa) ]]; then
  alias e='exa --icons --git'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons --git'
  alias la=ea
  alias lla='ea -l'
  alias ee='exa -aahl --icons --git'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

alias kanolab='ssh kanolab'
alias freccia='ssh freccia'
alias lyria='ssh lyria'
alias thalys='ssh thalys'

alias lg='lazygit'

export PATH=$HOME/.nodebrew/current/bin:$PATH
export TERM=xterm-256color
eval "$(pyenv init --path)"
export PATH="/Users/mizuki/.local/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH:bin
source "$HOME/.rye/env"
