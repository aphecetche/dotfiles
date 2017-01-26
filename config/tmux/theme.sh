
# just a dispatcher to the correct theme file
# can not be in the tmux.conf directly because of how set-environment
# is working, see e.g. http://unix.stackexchange.com/questions/50001/tmux-conf-embedding-a-shell-script

if-shell "test -f ${TMUX_THEME}" "source ${TMUX_THEME}" 'display "${TMUX_THEME} not found"'
