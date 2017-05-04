#!/bin/sh

echo "Starting dovecot brew service (needs sudo)"
sudo brew services start dovecot > /dev/null 2>&1

echo "Launching agents"
. ~/dotfiles/install/mail-mbsync-start.sh

echo "Starting postfix (needs sudo)"
sudo postfix start 
sudo postfix check

echo "starting stunnel"
stunnel

