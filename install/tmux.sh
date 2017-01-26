#!/usr/bin/env sh

# Install Tmux Plugin Manager, which takes care of the other plugins

if ! test -d ~/.tmux/plugins/tpm; then
    mkdir -p n ~/save
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ~/.tmux/plugins/tpm/bin/install_plugins
else
    ~/.tmux/plugins/tpm/bin/update_plugins all
fi


