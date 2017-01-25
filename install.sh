#!/usr/bin/env sh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# must set the DOTFILES variable to point to where you cloned
# the dotfiles repository. Everything else follows from there.
export DOTFILES=~/dotfiles

. ./install/base16.sh
. ./install/prezto.sh
. ./install/link.sh

if [ "$(uname)" = "Darwin" ]; then

    echo -e "\n\nRunning on OSX" 

    . ./install/brew.sh
    . ./install/osx.sh

fi


