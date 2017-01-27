#!/usr/bin/env sh

mkdir -p $HOME/.local/share/fonts

for rep in supermarin/YosemiteSanFranciscoFont gabrielelana/awesome-terminal-fonts RedHatBrand/Overpass; do
    if test -f $HOME/.local/share/fonts/$rep; then
        cd $HOME/.local/share/fonts/$rep
        git pull
    else
        git clone --depth=1 https://github.com/$rep $HOME/.local/share/fonts/$rep
    fi
done

fc-cache
