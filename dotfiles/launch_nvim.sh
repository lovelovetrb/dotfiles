#!/bin/bash

# Set the path to the Neovim
# NVIM_PATH="$HOME/nvim.appimage"
# NVIM_PATH=$(command -v nvim)

rebuild_flag=""
if [[ "$1" == "-r" || "$1" == "--rebuild" ]]; then
  rebuild_flag="--remove-existing-container"
fi

#
# Get the Neovim config path using headless nvim
config_path=$($NVIM_PATH --headless -c 'lua io.stdout:write(vim.fn.stdpath("config"))' -c 'q' --clean)
# Resolve symlink for the config path
resolved_config_path=$(readlink -f "$config_path")

if [ -d ".devcontainer" ]; then
  # SSHエージェントのソケットパスを設定
  SSH_AUTH_SOCK_PATH="${SSH_AUTH_SOCK:-$HOME/.ssh/agent.sock}"
  
  # Construct the command to run the devcontainer
  command="devcontainer up $rebuild_flag \
    --mount type=bind,source=$resolved_config_path,target=/nvim-config/nvim \
    --mount type=bind,source=${HOME}/.gitconfig,target=/root/.gitconfig \
    --mount type=bind,source=${SSH_AUTH_SOCK_PATH},target=/ssh-agent \
    --additional-features='{ \
    \"ghcr.io/duduribeiro/devcontainer-features/neovim:1\": { \"version\": \"stable\" }, \
    \"ghcr.io/devcontainers/features/node:1\": { \"version\": \"lts\" }, \
    \"ghcr.io/GeorgOfenbeck/features/lazygit-linuxbinary:1\": {} \
    }' \
    --workspace-folder ."
  
  # Print the constructed command
  echo "$command"
  # Run the command
  eval "$command"
  
  # devcontainerを実行する際にSSH_AUTH_SOCKを設定
  eval "devcontainer exec \
    --remote-env XDG_CONFIG_HOME=/nvim-config \
    --remote-env SHELL=/bin/bash \
    --remote-env SSH_AUTH_SOCK=/ssh-agent \
    --workspace-folder . \
    nvim -c 'lua require(\"noice\").redirect(function() local notify = require(\"notify\"); notify(\"You are in devcontainer\", \"info\", { title = \"Activate venv\" }) end)'"
else
    eval "$NVIM_PATH -c 'lua require(\"noice\").redirect(function() local notify = require(\"notify\"); notify(\"You are in Local Env\", \"info\", { title = \"Activate venv\" }) end)'"
fi
