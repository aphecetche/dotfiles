#!/usr/bin/env bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then

    echo -e "\n\nRunning on OSX" 

    source install/brew.sh

    source install/osx.sh

    source install/nvm.sh

fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

# chsh -s $(which zsh) -> was not working for me (non-default shell error message)
# see http://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/

current=$(dscl . read /Users/$USER UserShell | cut -d ' ' -f 2)
current=$(basename $current)

if [[ "$current" != "zsh" ]]; then
  echo "Making zsh the default shell"
  sudo dscl . -create /Users/$USER UserShell $(which zsh)
else
  echo "zsh is already the default shell. Nice."
fi

echo "Done."

