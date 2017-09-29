#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    TRAVIS=1 && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

for pkg in \
    wget \
    git-lfs	\
    hub \
    reattach-to-user-namespace \
    tmux \
    iproute2mac \
    ag \
    go \
    ctags \
; do
brew install "$pkg"
done

