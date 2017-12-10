#!/bin/sh

echo "Will require sudo"
sudo echo 

if test ! $(which brew); then
    echo "Installing homebrew"
    TRAVIS=1 && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

for pkg in \
    wget \
    hub \
    reattach-to-user-namespace \
    tmux \
    iproute2mac \
    ag \
    ; do
brew install "$pkg"
done

# to be considered at some point : 
#    ag \
#    go \
#    ctags \
#    git-lfs	\

