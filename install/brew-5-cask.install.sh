#!/usr/bin/env sh

for app in \
    iterm2 \
    docker \
    1password \
    dropbox \
    nomachine \
    slack \
    xlite \
    transmit \
    launchcontrol \
    ; do
    brew cask install $app
done
