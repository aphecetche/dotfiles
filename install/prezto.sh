#!/usr/bin/env sh

if ! test -d $HOME/github.com/aphecetche/prezto; then
    git clone https://github.com/aphecetche/prezto.git $HOME/github.com/aphecetche/prezto
    pushd $HOME/github.com/aphecetche/prezto > /dev/null
    git submodule update --init --remote --recursive
    popd > /dev/null
fi

ln -s $HOME/github.com/aphecetche/prezto $DOTFILES/

# link for prezto files
# mind the order, first the $HOME/.zpresto then the rest...

echo -e "\n\nCreating zprezto symlink"
echo "=============================="
rm -f $HOME/.zprezto
ln -s $DOTFILES/prezto $HOME/.zprezto
for rcfile in $(find "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/ -name z*); do
    echo "Creating symlink for $rcfile"
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.$(basename $rcfile)"
done

