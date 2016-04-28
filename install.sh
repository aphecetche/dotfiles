#!/usr/bin/env zsh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# must set the DOTFILES variable to point to where you cloned
# the dotfiles repository. Everything else follows from there.
export DOTFILES=~/dotfiles

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then

    echo -e "\n\nRunning on OSX" 

    source install/brew.sh

    source install/osx.sh

#    source install/nvm.sh

fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Done."

