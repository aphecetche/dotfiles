## To find out the colour used by the current base16 theme
# use the base16-shell/colortest utility

# default statusbar colors
set-option -g status-bg colour18
set-option -g status-fg colour07
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour20 
set-window-option -g window-status-bg default
set-window-option -g window-status-attr default

# active window title colors
set-window-option -g window-status-current-fg colour18
set-window-option -g window-status-current-bg colour04
# set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour02
set-option -g pane-border-bg colour00
set-option -g pane-active-border-fg colour00

# message text
set-option -g message-bg default
set-option -g message-fg colour02
set-option -g message-attr bright

# pane number display
set-option -g display-panes-active-colour blue #blue
set-option -g display-panes-colour brightred #orange

# clock
set-window-option -g clock-mode-colour green #green

# bell
set-window-option -g window-status-bell-style fg=black,bg=red #base02, red


# Status bar

set -g window-status-format "#I #W"
set -g status-position bottom
set -g status-left "#[fg=colour09][#S] "
set -g status-right "#[fg=colour20]Battery:#{battery_percentage} | %a %d-%b-%Y #[fg=colour17]%H:%M" 
set -g status-right-length 100
set -g status-justify left

