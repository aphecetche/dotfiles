# 
## To find out the colour used by the current base16 theme
# use the base16-shell/colortest utility

# statusbar colours
set-option -g status-bg colour18
set-option -g status-fg colour07
set-option -g status-attr default

# window colours
set-window-option window-style 'bg=colour18'
set-window-option window-active-style 'bg=colour00'

# pane border
set-window-option pane-border-style 'bg=colour18,fg=colour20'
set-window-option pane-active-border-style 'bg=colour00,fg=colour02'

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

set -g @batt_charged_icon "i"
set -g @batt_charging_icon ""

set -g window-status-format "#I #W"
set -g status-position bottom
set -g status-left "#[fg=colour01][#S] "
set -g status-right "#[fg=colour20]#{battery_icon}#{battery_percentage}  %a %d %b #[fg=colour01] %H:%M" 
set -g status-right-length 100
set -g status-justify left

