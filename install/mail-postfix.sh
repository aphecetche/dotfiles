#!/bin/sh

sudo cp ~/dotfiles/config/mail/postfix-main.cf /etc/postfix/main.cf
sudo cp ~/dotfiles/config/mail/postfix-sender_relay /etc/postfix/sender_relay

pdb=/etc/postfix/sasl_passwd

sudo rm -f $pdb

sudo touch $pdb

sudo chmod 600 $pdb

echo "# destination   credentials" | sudo tee -a $pdb > /dev/null

echo "[smtp.gmail.com]:587 laurent.aphecetche@gmail.com:$(security find-generic-password -s mbsync-gmail-password -w)" | sudo tee -a $pdb > /dev/null
echo "[smtp.cern.ch]:587 laphecet:$(security find-generic-password -s mbsync-cern-password -w)" | sudo tee -a $pdb > /dev/null
echo "[127.0.0.1]:11125 aphecete@subatech.in2p3.fr:$(security find-generic-password -s mbsync-ccsubatech-password -w)" | sudo tee -a $pdb > /dev/null
echo "[smtp.mail.me.com]:587 laurent.aphecetche@icloud.com:$(security find-generic-password -s mbsync-icloud-password -w)" | sudo tee -a $pdb > /dev/null

sudo postmap /etc/postfix/sender_relay
sudo postmap /etc/postfix/sasl_passwd

