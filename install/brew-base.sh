#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

for pkg in \
	wget \
	git \
	hub \
	reattach-to-user-namespace \
	tmux \
	iproute2mac \
	; do
  brew install "$pkg"
done

