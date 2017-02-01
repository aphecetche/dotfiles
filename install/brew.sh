#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# cli tools
brew install wget

# development tools
brew install git
brew install hub
brew install reattach-to-user-namespace
brew install tmux

# to build ALICE software 
brew install cmake automake autoconf libtool

