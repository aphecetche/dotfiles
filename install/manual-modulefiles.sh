#!/usr/bin/env sh

mkdir -p ~/privatemodules

for f in $(find ~/github.com/aphecetche/ -name "*.modulefile")
do
  ln -si $f ~/privatemodules/$(basename -s .modulefile $f)
done
