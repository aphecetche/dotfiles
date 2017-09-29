#!/bin/sh

. ~/dotfiles/install/mail-mbsync-stop.sh

echo "Stopping dovecot brew service (needs sudo)"
sudo brew services stop dovecot > /dev/null 2>&1

echo "Stopping postfix (needs sudo)"
sudo postfix status && sudo postfix stop
sudo postfix check

echo "killing stunnel"
killall -9 stunnel
