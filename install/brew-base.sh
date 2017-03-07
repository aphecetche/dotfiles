#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# note that we specify git (below) for the record, but actually it should be 
# there from the very beginning to be able to checkout this very repository ;-)

for pkg in \
	wget \
	git \ 
	hub \
	reattach-to-user-namespace \
	tmux \
	iproute2mac \
    ag \
    go \
    pyenv \
    ctags
	; do
  brew install "$pkg"
done

