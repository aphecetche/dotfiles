#!/bin/sh

usersdb=/usr/local/etc/dovecot/usersdb

rm -f $usersdb

touch $usersdb

for u in ccsubatech cern gmail icloud;  do
    p=$(doveadm pw -s MD5-CRYPT -p $(security find-generic-password -s dovecot-$u-password -w))
    echo "$u:$p:$(id -u):$(id -g)::$HOME/::userdb_mail=maildir:~/maildir/%u:INDEX=~/dovecot/index/%u:CONTROL=~/dovecot/control/%u:INBOX=~/maildir/%u/INBOX:LAYOUT=fs" >> $usersdb
done


