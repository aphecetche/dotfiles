#!/usr/bin/env sh

for app in \
    xmind \
    yed \
    zotero \
    duet \
    kindle \
    ; do
    brew cask install $app
done

# brew cask install nomachine 
# brew cask install vmware-fusion
