#!/usr/bin/env sh

# temp directory for vim
mkdir -p ~/.vim-tmp

# insure the plugin system is initialized
vim --not-a-term -c "PlugInstall! | qall!"

