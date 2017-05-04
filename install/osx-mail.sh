#!/bin/sh

echo "*** NOW ENTERING MAIL SETUP ($0)"

# the mail setup consists of dovecot+mbsync+postfix
#
# note that a keypart (pun intended) is the dovecot server
# certificate to be used to authenticate to dovecot (by mbsync)

# stop everything related to mail
~/dotfiles/install/mail-stop.sh || return 1 

#make the server cert
~/dotfiles/install/mail-dovecot-cert.sh || return 2

#generate local {user,pass} pairs to be used for dovecot authentication
# and store them in keychain
~/dotfiles/install/mail-gen-local-pass.sh || return 3

# delete the configuration, and link it
# to ~/dotfiles/config/mail/dovecot.conf
# in osx-mail.postlinker
rm -f /usr/local/etc/dovecot/dovecot.conf
ln -si ~/dotfiles/config/mail/dovecot.conf /usr/local/etc/dovecot/dovecot.conf

#make the (local, mail only) users db
~/dotfiles/install/mail-dovecot-usersdb.sh || return 4

# postfix configuration
~/dotfiles/install/mail-postfix.sh || return 5

# stunnel conf
cp ~/dotfiles/config/mail/stunnel.conf /usr/local/etc/stunnel/

# restart everything
~/dotfiles/install/mail-start.sh || return 6
