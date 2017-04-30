#!/usr/bin/env sh
# 
# mu searches to fake virtual mailboxes in mutt
#

MD=~/Maildir.mutt

/usr/local/bin/mu index -m $MD

# all sent messages
/usr/local/bin/mu find m:"/cern/Sent Messages" or m:"/ccsubatech/Sent Messages" or m:"/gmail/Sent Messages" or m:"/icloud/Sent Messages" --format=links --linksdir=$MD/mu/sent --clearlinks

# combined subatech+cern inbox
/usr/local/bin/mu find m:/cern/INBOX or m:/ccsubatech/INBOX --format=links --linksdir=$MD/mu/inbox-work --clearlinks

# today, this week, this month
/usr/local/bin/mu find date:today..now --format=links --linksdir=$MD/mu/today --clearlinks
/usr/local/bin/mu find date:1w..now --format=links --linksdir=$MD/mu/thisweek --clearlinks
/usr/local/bin/mu find date:4w..now --format=links --linksdir=$MD/mu/thismonth --clearlinks

