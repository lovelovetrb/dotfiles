#!/bin/bash

rebuild_flag=""
if [[ "$1" == "-r" || "$1" == "--rebuild" ]]; then
  rebuild_flag="--remove-existing-container"
fi

# Get the Neovim config path using headless nvim
config_path=$(nvim --headless -c 'lua io.stdout:write(vim.fn.stdpath("config"))' -c 'q' --clean)

# Resolve symlink for the config path
resolved_config_path=$(readlink -f "$config_path")

# Construct the command to run the devcontainer
command="devcontainer up $rebuild_flag \
  --mount type=bind,source=$resolved_config_path,target=/nvim-config/nvim \
  --additional-features='{ \
  \"ghcr.io/duduribeiro/devcontainer-features/neovim:1\": { \"version\": \"stable\" }, \
  \"ghcr.io/devcontainers/features/node:1\": { \"version\": \"lts\" } \
  }' \
  --workspace-folder ."

# Print the constructed command
echo "$command"

# Run the command
eval "$command"

eval "devcontainer exec \
  --remote-env XDG_CONFIG_HOME=/nvim-config \
  --remote-env SHELL=/bin/bash \
  --workspace-folder . \
  nvim"
