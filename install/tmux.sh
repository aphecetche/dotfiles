#!/usr/bin/env sh

# Install Tmux Plugin Manager, which takes care of the other plugins

if ! test -d ~/.tmux/plugins/tpm; then
    mkdir -p ~/save
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # I have some personal mods to this one...
    git clone https://github.com/aphecetche/tmux-continuum ~/.tmux/plugins/tmux-continuum
    ~/.tmux/plugins/tpm/bin/install_plugins
else
    cd ~/.tmux/plugins/tpm
    git pull
    . ./bin/update_plugins all
fi


