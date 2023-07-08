#!/bin/bash

cd "$(dirname "$(readlink -f "$0")")"

# set $XDG_CONFIG_HOME if not already set
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

# make sure this repo is up to date
git pull

sudo -v
# install a few things from apt
sudo apt-get update 
sudo apt-get install -y fd-find ripgrep fzf python3-pip
# install neovim from snap
sudo snap install nvim --classic

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz

# check if the $XDG_CONFIG_HOME/nvim directory exists
if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
  mkdir -p $XDG_CONFIG_HOME/nvim
fi

# link init.lua, if not already linked
if [ ! -L "$XDG_CONFIG_HOME/nvim/init.lua" ]; then
  ln -s $(pwd)/init.lua $XDG_CONFIG_HOME/nvim/init.lua
fi

# link lua directory, if not already linked
if [ ! -L "$XDG_CONFIG_HOME/nvim/lua" ]; then
  ln -s $(pwd)/lua $XDG_CONFIG_HOME/nvim/
fi

