#!/usr/bin/env sh


# This script can only have a chance of success if :  
# - is executed from the directory it resides in
# - the shell is already zsh. 

# the assumption is that this directory is in ~/dotfiles
# Everything else follows from there.

install()
{
  local what=$1
  echo -n "installing $what..."
  . ./install/$what.sh 2>&1 > /dev/null && echo "$what installed" || { echo "failed to install $what"; return 1 }
}

for what in vim base16 prezto term tmux; do
    install $what || break 
done

# . ./install/linker.sh && dotfiles_link
#
# if [ "$(uname)" = "Darwin" ]; then
#
#     echo -e "\n\nRunning on OSX" 
#
#     . ./install/brew.sh
#     . ./install/osx.sh
#
# fi
#
#
