#!/usr/bin/env sh

# setup of base16-shell

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

