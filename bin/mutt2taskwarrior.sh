#!/usr/bin/env bash
# script to convert, from within Mutt, a mail 
# into a taskwarrior task
# from http://www.titus-stahl.de/blog/2015/08/13/a-better-taskwarrior-integration-for-mutt/

while IFS= read -r line; do
    if echo $line | grep -q "^From:" ; then
        # Only take the first line starting with "From: "
        if [ ! -n "$F" ] ; then
            F=`echo $line | grep 'From:' | awk -F: '{print $2}'`
        fi
    fi
    if echo $line | grep -q "^Subject:" ; then
        S=`echo $line | grep 'Subject:' | awk -F: '{print $2}'`
    fi
done

/usr/local/bin/task add  task add +email "E-mail $S (from $F)"
