#!/bin/sh

for account in icloud gmail cern ccsubatech; do 
    launchctl unload ~/Library/LaunchAgents/fr.aphecetche.mbsync.$account.plist > /dev/null 2>&1
done


