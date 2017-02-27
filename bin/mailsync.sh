#!/usr/bin/env sh
#
# script to sync imap stuff
# = imapfilter + mbsync + mu index

sync=$1
shift

dir="$HOME/dotfiles/config/imapfilter"

for filter in $@; do
    filterscript="$dir/$filter.lua" 
    if test -f "$filterscript"; then
        pushd $dir > /dev/null
        date && echo "Starting filtering for $filter" && /usr/local/bin/imapfilter -c "$filterscript" && echo "done"
        popd > /dev/null 
    fi
done

date && echo "Starting mbsync for $sync" && /usr/local/bin/mbsync $sync && echo "mbsync done" && date

/usr/local/bin/mu index


