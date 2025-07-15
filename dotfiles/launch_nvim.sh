#!/bin/bash

# Set the path to the Neovim
# NVIM_PATH="$HOME/nvim.appimage"
NVIM_PATH=$(command -v nvim)

# 第一引数が存在するファイルならnvimで開く
if [ -n "$1" ] && [ -f "$1" ]; then
  $NVIM_PATH "$1"
  exit 0
fi

rebuild_flag=""
if [[ "$1" == "-r" || "$1" == "--rebuild" ]]; then
  rebuild_flag="--remove-existing-container"
fi

if [[ "$1" == "-l" || "$1" == "--local" ]]; then
  eval "$NVIM_PATH -c 'lua require(\"noice\").redirect(function() local notify = require(\"notify\"); notify(\"You are in Local Env\", \"info\", { title = \"Activate venv\" }) end)'"
  exit 0
fi

# Get the Neovim config path using headless nvim
config_path=$($NVIM_PATH --headless -c 'lua io.stdout:write(vim.fn.stdpath("config"))' -c 'q' --clean)
# Resolve symlink for the config path
resolved_config_path=$(readlink -f "$config_path")

if [ -d ".devcontainer" ] || [ -f ".devcontainer.json" ]; then
  # devcontainerコマンドを構築
  command="devcontainer up $rebuild_flag \
    --mount type=bind,source=$resolved_config_path,target=/home/vscode/.config/nvim \
    --mount type=bind,source=${HOME}/.gitconfig,target=/etc/gitconfig \
    --additional-features='{ 
    \"ghcr.io/duduribeiro/devcontainer-features/neovim:1\": { \"version\": \"stable\" }, 
    \"ghcr.io/GeorgOfenbeck/features/lazygit-linuxbinary:1\": {}, 
    }' \
    --workspace-folder ."
  
  
  # Print the constructed command
  echo "$command"
  # Run the command
  eval "$command"

  eval "devcontainer exec \
    --remote-env XDG_CONFIG_HOME=/home/vscode/.config \
    --remote-env SHELL=/bin/bash \
    --workspace-folder . \
    nvim -c 'lua require(\"noice\").redirect(function() local notify = require(\"notify\"); notify(\"You are in devcontainer\", \"info\", { title = \"Env notice\" }) end)'"
else
    eval "$NVIM_PATH -c 'lua require(\"noice\").redirect(function() local notify = require(\"notify\"); notify(\"You are in Local Env\", \"info\", { title = \"Env notice\" }) end)'"
fi
