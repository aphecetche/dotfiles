
export TMUX_HOST_ICON=''
uname | grep -q Darwin && TMUX_HOST_ICON=''

# statusbar colours
tmux set-option -g status-bg $TMUX_STATUS_BAR_BG_COLOR
tmux set-option -g status-fg $TMUX_STATUS_BAR_FG_COLOR 
tmux set-option -g status-attr default

# window colours
tmux set-option -g window-style        bg=$TMUX_WINDOW_INACTIVE_BG_COLOR
tmux set-option -g window-active-style bg=$TMUX_WINDOW_ACTIVE_BG_COLOR

# pane border
tmux set-option -g pane-border-style bg=$TMUX_WINDOW_INACTIVE_BG_COLOR,fg=$TMUX_STATUS_BAR_FG_COLOR
tmux set-option -g pane-active-border-style bg=$TMUX_WINDOW_ACTIVE_BG_COLOR,fg=$TMUX_WINDOW_STATUS_CURRENT_FG_COLOR

# message text
tmux set-option -g message-bg default
tmux set-option -g message-fg $TMUX_MESSAGE_COLOR
tmux set-option -g message-attr bright

# pane number display
tmux set-option -g display-panes-active-colour $TMUX_WINDOW_STATUS_CURRENT_FG_COLOR
tmux set-option -g display-panes-colour $TMUX_STATUS_BAR_FG_COLOR

# clock
tmux set-option -g clock-mode-colour $TMUX_STATUS_BAR_LEFT_SESSION_COLOR

# bell
tmux set-option -g window-status-bell-style fg=black,bg=$TMUX_STATUS_BAR_LEFT_SESSION_COLOR

# 


tmux set -g @batt_charged_icon ""
tmux set -g @batt_charging_icon ""

tmux set -g window-status-current-format "#I #W #{?window_zoomed_flag,"",""}"
tmux set -g window-status-current-fg $TMUX_WINDOW_STATUS_CURRENT_FG_COLOR
tmux set -g window-status-current-bg $TMUX_WINDOW_STATUS_CURRENT_BG_COLOR 
tmux set -g window-status-current-attr bold
tmux set -g window-status-format "#I #W  "
tmux set -g status-position bottom

 tmux set -g status-left "#[fg=$TMUX_STATUS_BAR_LEFT_SESSION_COLOR][#S] "

tmux set -g status-right "#(whoami) #[fg=$TMUX_STATUS_BAR_FG_COLOR]#{battery_icon}  #{battery_percentage}  %a %d %b #[fg=$TMUX_CLOCK_COLOR] %H:%M#[fg=$TMUX_WINDOW_STATUS_CURRENT_FG_COLOR]$TMUX_HOST_ICON "
tmux set -g status-right-length 110
tmux set -g status-left-length 100
tmux set -g status-justify left

