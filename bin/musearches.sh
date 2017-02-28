#!/usr/bin/env sh
# 
# mu searches to fake virtual mailboxes in mutt
#

# /usr/local/bin/mu find subject:"[GIT*" --format=links --linksdir=~/Maildir/mu/git --clearlinks

/usr/local/bin/mu find m:"/cern/Sent Messages" or m:"/subatech/Sent Messages" or m:"/gmail/Sent Messages" or m:"/icloud/Sent Messages" --format=links --linksdir=~/Maildir/mu/sent --clearlinks

/usr/local/bin/mu find m:/cern/INBOX or m:/subatech/INBOX --format=links --linksdir=~/Maildir/mu/inbox-work --clearlinks
