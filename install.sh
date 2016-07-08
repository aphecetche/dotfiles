#!/usr/bin/sh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# must set the DOTFILES variable to point to where you cloned
# the dotfiles repository. Everything else follows from there.
export DOTFILES=~/dotfiles

git clone https://github.com/chriskempson/base16-shell.git $DOTFILES/base16-shell
git clone https://github.com/aphecetche/prezto.git $DOTFILES/prezto

. ./install/link.sh

if [ "$(uname)" == "Darwin" ]; then

    echo -e "\n\nRunning on OSX" 

    source install/brew.sh

    source install/osx.sh

#    source install/nvm.sh

fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "installing italic terminfo"
tic tmux-256color-italic.terminfo
tic xterm-256color-italic.terminfo
echo "Done."

