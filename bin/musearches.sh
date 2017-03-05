#!/usr/bin/env sh
# 
# mu searches to fake virtual mailboxes in mutt
#

/usr/local/bin/mu index

# /usr/local/bin/mu find subject:"[GIT*" --format=links --linksdir=~/Maildir/mu/git --clearlinks

# all sent messages
/usr/local/bin/mu find m:"/cern/Sent Messages" or m:"/subatech/Sent Messages" or m:"/gmail/Sent Messages" or m:"/icloud/Sent Messages" --format=links --linksdir=~/Maildir/mu/sent --clearlinks

# combined subatech+cern inbox
/usr/local/bin/mu find m:/cern/INBOX or m:/subatech/INBOX --format=links --linksdir=~/Maildir/mu/inbox-work --clearlinks

# today, this week, this month
/usr/local/bin/mu find date:today..now --format=links --linksdir=~/Maildir/mu/today --clearlinks
/usr/local/bin/mu find date:1w..now --format=links --linksdir=~/Maildir/mu/thisweek --clearlinks
/usr/local/bin/mu find date:4w..now --format=links --linksdir=~/Maildir/mu/thismonth --clearlinks

