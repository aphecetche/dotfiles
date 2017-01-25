#!/usr/bin/env sh

# setup of base16-shell

if ! test -d $HOME/github.com/chriskempson/base16-shell; then
    git clone https://github.com/chriskempson/base16-shell $HOME/github.com/chriskempson/base16-shell
    # I do not like the default selection color. Change it. 
    sed -i '' 's/93a1a1/eee8d5' $HOME/github/chriskempson/base16-shell/base16-solarized.light.sh
fi

ln -si $HOME/github.com/chriskempson/base16-shell $DOTFILES/
