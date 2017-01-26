#!/usr/bin/env sh

if ! test -d $HOME/github.com/aphecetche/prezto; then
    git clone https://github.com/aphecetche/prezto.git $HOME/github.com/aphecetche/prezto
    pushd $HOME/github.com/aphecetche/prezto > /dev/null
    git submodule update --init --remote --recursive
    popd > /dev/null
fi

