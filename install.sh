#!/usr/bin/env sh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# the assumption is that this directory is in ~/dotfiles
# Everything else follows from there.

. ./install/base16.sh
. ./install/prezto.sh
. ./install/term.sh
. ./install/tmux.sh
. ./install/vim.sh

. ./install/linker.sh && dotfiles_link

if [ "$(uname)" = "Darwin" ]; then

    echo -e "\n\nRunning on OSX" 

    . ./install/brew.sh
    . ./install/osx.sh

fi


