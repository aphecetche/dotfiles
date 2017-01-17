#!/bin/sh

rsync -avu --exclude '*.git' $1 -e "ssh -i /home/laurent/.ssh/arch-sync-key" laurent@mac:/Users/laurent/save/arch/
