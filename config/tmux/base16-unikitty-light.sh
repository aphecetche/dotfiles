# 
## To find out the colour used by the current base16 theme
# use the base16-shell/colortest utility
TMUX_STATUS_BAR_FG_COLOR="colour07"
TMUX_STATUS_BAR_BG_COLOR="colour19"
TMUX_STATUS_BAR_LEFT_SESSION_COLOR="colour09"

TMUX_WINDOW_INACTIVE_BG_COLOR="colour18"
TMUX_WINDOW_ACTIVE_BG_COLOR="colour00"

TMUX_WINDOW_STATUS_CURRENT_FG_COLOR="colour02"
TMUX_WINDOW_STATUS_CURRENT_BG_COLOR="colour19"

TMUX_MESSAGE_COLOR="colour12"
TMUX_CLOCK_COLOR="colour12"

TMUX_HOST_ICON=""
if-shell "uname | grep -q Darwin" "tmux set-env -g TMUX_HOST_ICON=''"


