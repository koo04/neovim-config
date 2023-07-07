#!/bin/bash

# make sure this repo is up to date
git pull

# set $XDG_CONFIG_HOME if not already set
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

# check if the $XDG_CONFIG_HOME/nvim directory exists
if [ ! -d "$XDG_CONFIG_HOME/nvim" ]; then
  mkdir -p $XDG_CONFIG_HOME/nvim
fi

# link init.lua, if not already linked
if [ ! -L "$XDG_CONFIG_HOME/nvim/init.lua" ]; then
  ln -s $PWD/init.lua $XDG_CONFIG_HOME/nvim/init.lua
fi

# link lua directory, if not already linked
if [ ! -L "$XDG_CONFIG_HOME/nvim/lua" ]; then
  ln -s $PWD/lua $XDG_CONFIG_HOME/nvim/lua
fi

