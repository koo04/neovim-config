# check if the symbolic link exists already
if [ -L $HOME/.config/nvim ]; then
    rm -rf $HOME/.config/nvim
    rm -rf $HOME/.local/share/nvim
fi

ln -s $(pwd) $HOME/.config/nvim
