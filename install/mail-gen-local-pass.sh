#!/bin/sh

for account in gmail icloud cern ccsubatech; do
    security delete-generic-password -s dovecot-$account-password > /dev/null 2>&1 
    # security add-generic-password -a ${USER} -s dovecot-$account-password -w "toto-$account"
 security add-generic-password -a ${USER} -s dovecot-$account-password -w "$(openssl rand -base64 14)"
done

