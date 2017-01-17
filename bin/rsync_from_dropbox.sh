#!/bin/sh

rsync -avu -e "ssh -i /home/laurent/.ssh/arch-sync-key" laurent@nanpc420.local:/Users/laurent/Dropbox/Private/KeePass/perso.kdbx /home/laurent/private

chmod 600 /home/laurent/private/perso.kdbx
