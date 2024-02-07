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

if [[ $(command -v bat) ]]; then
  alias cat='bat'
fi

alias kanolab='ssh kanolab'
alias freccia='ssh freccia'
alias lyria='ssh lyria'
alias thalys='ssh thalys -L 6006:localhost:6006'

alias lg='lazygit'
export EDITOR=nvim lazygit

export PATH=$HOME/.nodebrew/current/bin:$PATH

# pyenv setting
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


export TERM=xterm-256color
export PATH="/Users/mizuki/.local/bin:$PATH"
source "$HOME/.rye/env"

alias activate='source .venv/bin/activate'
alias dev='cd ~/dev'

alias vim='nvim'
alias v='nvim'
alias vi='nvim'
alias sv='sudo nvim'

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

# zsh-autocomplete plugin
znap source zsh-users/zsh-autosuggestions
bindkey '^k' autosuggest-accept

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mizuki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mizuki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mizuki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mizuki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/mizuki/.bun/_bun" ] && source "/Users/mizuki/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
