#!/usr/bin/sh 

for linker in $(ls $DOTFILES/install/*.linker) ; do
  $linker
done

