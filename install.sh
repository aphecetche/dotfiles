#!/usr/bin/env bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Darwin" ]; then

    echo -e "\n\nRunning on OSX" 

    source install/brew.sh

    source install/osx.sh

    source install/nvm.sh

fi

echo "Making zsh the default shell"
# chsh -s $(which zsh) -> was not working for me (non-default shell error message)
# see http://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/
sudo dscl . -create /Users/$USER UserShell $(which zsh)

echo "Done."

