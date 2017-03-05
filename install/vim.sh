#!/usr/bin/env sh

if [ "$(uname)" = "Darwin"]; then
    brew install vim --with-override-system-vi
fi

rm -rf ~/.vimrc ~/.vim

ln -s ~/dotfiles/config/nvim/init.vim ~/.vimrc
ln -s ~/dotfiles/config/nvim/ ~/.vim

# insure the plugin system is initialized

vim --not-a-term -c "PlugInstall! | qall!" 2>&1 > /dev/null

