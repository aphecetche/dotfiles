#!/bin/sh

rm -f /usr/local/etc/ssl/certs/dovecot.pem
sudo rm -f /usr/local/etc/ssl/private/dovecot.pem

# a certificate file must be used for dovecot (and mbsync needs
# it to authenticate to dovecot) : create it first
OPENSSLCONFIG=~/dotfiles/config/mail/dovecot-openssl.cnf ~/dotfiles/config/mail/mkcert.sh

