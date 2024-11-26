export LANG=en_US.UTF-8
export EDITOR=nvim lazygit
export PATH=$HOME/.nodebrew/current/bin:$PATH
export TERM=xterm-256color
export PATH="/Users/mizuki/.local/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin

eval source <(/usr/local/bin/starship init zsh --print-full-init)

if [[ $(command -v eza) ]]; then
  alias e='eza --icons --git'
  alias l=e
  alias ls=e
  alias ea='eza -a --icons --git'
  alias la=ea
  alias lla='ea -l'
  alias ee='eza -aahl --icons --git'
  alias ll=ee
  alias et='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

if [[ $(command -v bat) ]]; then
  alias cat='bat'
fi

alias kanolab-gateway='ssh kanolab-gateway'
alias kanolab='ssh kanolab'
alias freccia='ssh freccia'
alias lyria='ssh lyria'
alias thalys='ssh thalys'

alias lg='lazygit'

alias dev='cd ~/dev'

source "$HOME/.rye/env"

alias activate='source .venv/bin/activate'

alias vim='nvim'
alias v='nvim'
alias vi='nvim'
alias sv='sudo nvim'

alias icat='kitten icat'

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# zsh-syntax-highlighting plugin
source ~/.zsh-highlight-theme.zsh
znap source zsh-users/zsh-syntax-highlighting
# zsh-autocomplete plugin
znap source zsh-users/zsh-autosuggestions
bindkey '^y' autosuggest-accept

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# bun completions
[ -s "/Users/mizuki/.bun/_bun" ] && source "/Users/mizuki/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fvm
export PATH="$PATH":"$HOME/fvm/default/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mizuki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mizuki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mizuki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mizuki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
