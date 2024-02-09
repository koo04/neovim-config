# check if the symbolic link exists already
if [ -L $HOME/.config/nvim ]; then
    rm $HOME/.config/nvim
fi

ln -s $(pwd) $HOME/.config/nvim
