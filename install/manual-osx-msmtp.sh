#!/usr/bin/env sh

rm -f $HOME/.msmtprc
mkdir -p $HOME/.certificates
rm -f $HOME/.certificates/cacert.pem

cd $HOME/.certificates && curl --remote-name https://curl.haxx.se/ca/cacert.pem

cp $HOME/dotfiles/config/msmtp/msmtprc $HOME/.msmtprc

chmod 600 $HOME/.msmtprc

mkdir -p ~/.msmtp.queue
chmod 700 ~/.msmtp.queue
chmod 600 .msmtp.queue.log
