#!/bin/bash

sudo apt-get install -y wget build-essential make python-is-python3 python3-pip jq curl python3-venv cargo
curl -fsSL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
sudo -E bash /tmp/nodesource_setup.sh
sudo apt-get install -y nodejs

# check if nvim is not installed
if ! command -v nvim &> /dev/null
then
    sudo snap install nvim --classic
fi

# lazy git
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
sudo install /tmp/lazygit /usr/local/bin

# clone the repo
if [ ! -d $HOME/.config/nvim ]; then
    git clone git@github.com:koo04/neovim-config $HOME/.config/nvim
fi

# check if the symbolic link exists already
if [ -L $HOME/.config/nvim ]; then
    rm -rf $HOME/.config/nvim $HOME/.local/share/nvim $HOME/.local/state/nvim $HOME/.cache/nvim
fi

ln -s $(pwd) $HOME/.config/nvim
