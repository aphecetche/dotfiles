#!/usr/bin/env sh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# the assumption is that this directory is in ~/dotfiles
# Everything else follows from there.

. ~/dotfiles/dotfiles.sh

dotfiles_install_all

