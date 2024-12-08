ulimit -n 65536

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lla='ls -lA'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
alias activate='source .venv/bin/activate'
alias sys_python='~/python3.10/bin/python3'
source "$HOME/.cargo/env"

alias dev='cd ~/dev'

alias nvim='~/dotfiles/dotfiles/launch_nvim.sh'
alias v='nvim'

if [[ $(command -v lazygit) ]]; then
    alias lg='lazygit'
fi

eval "$(starship init bash)"
