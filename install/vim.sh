#!/usr/bin/env sh

# temp directory for vim
mkdir -p ~/.vim-tmp 2>&1 > /dev/null

# insure the plugin system is initialized
vim -E -c "PlugInstall!" -c "qall!" 2>&1 > /dev/null

