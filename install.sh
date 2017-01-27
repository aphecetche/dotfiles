#!/usr/bin/env sh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# the assumption is that this directory is in ~/dotfiles
# Everything else follows from there.

. ~/dotfiles/dotfiles.sh

dotfiles_install_all

# by default we install only the dockerized vim
# specify --native-vim option of this script
# to (try to) install also native vim
# (should work on OSX, not on ArchLinux so far)

if [ $# -gt 0 ]; then

    if [ "$1" = "--native-vim" ]; then
        dotfiles_install vim
    fi
fi
