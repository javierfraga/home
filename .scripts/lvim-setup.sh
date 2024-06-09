#!/bin/bash

# Prompt the user to continue
read -p "Do you want to continue with the installation? (y/n): " choice

# Check the user's choice
if [[ "$choice" != "y" ]]; then
  echo "Installation aborted."
  exit 1
fi

# Proceed with the installation
git clone https://github.com/javierfraga/nvim.git ~/.config/nvim
bash ~/.config/nvim/pack/nvim-plugins/start/run-me.sh
git clone https://github.com/javierfraga/lvim.git ~/.config/lvim
bash ~/.config/lvim/lua/run-me.sh
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

