#!/usr/bin/sh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# must set the DOTFILES variable to point to where you cloned
# the dotfiles repository. Everything else follows from there.
export DOTFILES=~/dotfiles

mkdir -p $HOME/github.com/aphecetche

if ! test -d $HOME/github.com/aphecetche/base16-shell; then
    git clone https://github.com/aphecetche/base16-shell.git $HOME/github.com/aphecetche/base16-shell
fi

ln -si $HOME/github.com/aphecetche/base16-shell $DOTFILES/

if ! test -d $HOME/github.com/aphecetche/prezto; then
    git clone https://github.com/aphecetche/prezto.git $HOME/github.com/aphecetche/prezto
    pushd $HOME/github.com/aphecetche/prezto > /dev/null
    git submodule update --init --remote --recursive
    popd > /dev/null
fi

ln -si $HOME/github.com/aphecetche/prezto $DOTFILES/

. ./install/link.sh

if [ "$(uname)" = "Darwin" ]; then

    echo -e "\n\nRunning on OSX" 

    source install/brew.sh
    source install/osx.sh

fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "installing italic terminfo"
tic tmux-256color-italic.terminfo
tic xterm-256color-italic.terminfo
echo "Done."

