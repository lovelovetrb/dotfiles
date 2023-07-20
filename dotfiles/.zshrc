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
alias code='code-insiders'

export PATH=$HOME/.nodebrew/current/bin:$PATH
export TERM=xterm-256color
eval "$(pyenv init --path)"
export PATH="/Users/mizuki/.local/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH:bin
source "$HOME/.rye/env"

alias activate='source .venv/bin/activate'
alias dev='cd ~/dev'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mizuki/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mizuki/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mizuki/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mizuki/google-cloud-sdk/completion.zsh.inc'; fi

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# zsh-autocomplete plugin
znap source zsh-users/zsh-autosuggestions
bindkey '^k' autosuggest-accept
