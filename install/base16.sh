#!/usr/bin/env sh

# setup of base16-shell

if ! test -d $HOME/github.com/chriskempson/base16-shell; then
    git clone https://github.com/chriskempson/base16-shell $HOME/github.com/chriskempson/base16-shell
    # I do not like the default selection color. Change it. 
    sed -i '' 's/93a1a1/eee8d5/' $HOME/github/chriskempson/base16-shell/base16-solarized.light.sh
else
    pushd $HOME/github.com/chriskempson/base16-shell
    git pull 2>&1 > /dev/null
    popd
fi

ln -sf $HOME/github.com/chriskempson/base16-shell $DOTFILES/

if [ "$(uname)" = "Darwin" ]; then
    # base16 for iterm2
    if ! test -d ~/github.com/chriskempson/base16-iterm2; then
        git clone https://github.com/chriskempson/base16-iterm2 ~/github.com/chriskempson/base16-iterm2
    else
        pushd $HOME/github.com/chriskempson/base16-iterm2
        git pull 2>&1 > /dev/null
        popd
    fi
fi

