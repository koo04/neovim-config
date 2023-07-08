#!/bin/bash

cd -

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

