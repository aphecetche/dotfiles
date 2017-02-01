#!/usr/bin/env sh

for app in \
    vmware-fusion\
    iterm2 \
    docker \
    1password \
    evernote \
    dropbox \
    nomachine \
    slack \
    xlite \
    xmind \
    yed \
    zotero \
    transmit \
    duet \
    kindle \
    ; do
    brew cask info $app
done
