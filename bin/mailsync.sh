#!/usr/bin/env sh
#
# script to sync imap stuff

EMAIL_CONN_TEST=n

# connection test (inspired) from the mstmpq script
#   EMAIL_CONN_TEST 
#                       if =p or unset will use a ping test (debian.org) for a connection
#                       if =P will use a fast ping test (8.8.8.8) for a connection
#                       if =n will use netcat (nc) to test for a connection
# test whether system is connected
# returns t/f (0/1)
#

sync=$1
conf=~/dotfiles/config/mail/$sync.mbsyncrc

date && echo "STARTING sync=$sync conf=$conf"
connect_test() {
  if [ -z "$EMAIL_CONN_TEST" ] || \
     [ "$EMAIL_CONN_TEST" = 'p' ] ; then                       # use ping test (default)
    # verify net connection - ping ip address of debian.org
    # would ping -qnc2 -w4 be better ?
    # would ping -qnc1 -w10 or -w20 be better ?
    #ping -qnc1 -w4 debian.org >/dev/null 2>&1 || return 1
    ping -qnc2 -w10 debian.org >/dev/null 2>&1 || return 1

  elif [ "$EMAIL_CONN_TEST" = 'P' ] ; then                     # use quicker ping test
    # I personally think that including a DNS lookup
    # is a better connection test but some
    # have found the above test too slow
    ping -qnc1 -w4 8.8.8.8 >/dev/null 2>&1 || return 1

  elif [ "$EMAIL_CONN_TEST" = 'n' ] ; then                     # use netcat (nc) test
    # must, of course, have netcat (nc) installed
    which nc >/dev/null 2>&1 || \
      log -e 1 "msmtpq : can't find netcat executable [ nc ]"  # if not found - complain ; quit
    'nc' -vz www.debian.org 80 >/dev/null 2>&1 || return 1
  fi
  return 0
}

connect_test || { printf "no connection. doing nothing\n" ; exit 1 ; }

date && echo "Starting mbsync for $sync" && /usr/local/bin/mbsync -c $conf $sync && echo "mbsync done" && date

