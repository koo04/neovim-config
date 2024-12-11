#!/bin/bash

sudo apt-get install -y wget build-essential make python-is-python3 python3-pip jq curl python3-venv cargo fd-find
curl -fsSL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
sudo -E bash /tmp/nodesource_setup.sh
sudo apt-get install -y nodejs

# check if nvim is not installed
if ! command -v nvim &>/dev/null; then
  sudo snap install nvim --classic
fi

# ripgrep
LOC=$(pwd)
cd /tmp/
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
cd $LOC

# lazy git
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
sudo install /tmp/lazygit /usr/local/bin

if [ ! -d $HOME/git ]; then
  mkdir $HOME/git
fi

if [ ! -d $HOME/git/neovim-config ]; then
  git clone git@github.com:koo04/neovim-config $HOME/git
fi

# check if the symbolic link exists already
if [ -L $HOME/.config/nvim ]; then
  rm -rf $HOME/.config/nvim $HOME/.local/share/nvim $HOME/.local/state/nvim $HOME/.cache/nvim
fi

ln -s $HOME/git/neovim-config $HOME/.config/nvim
