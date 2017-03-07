#!/bin/sh

BASE16_SHELL=/root/base16-shell

# do not use the profile_helper script as it does dot fare well with ash shell
# but do here just what we need
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

script=$BASE16_SHELL/scripts/$BASE16_THEME.sh

if test -f $script; then
	. $script
fi

if test -d /go; then
    export GOROOT=/go
    export PATH=$PATH:$GOROOT/bin
fi

vim -i NONE "$@"

