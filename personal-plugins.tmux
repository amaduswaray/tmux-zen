#!/usr/bin/env bash

# Install the following tools
# bash, bc, coreutils, gawk, gh, glab, gsed, jq, nowplaying-cli
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_PATH="$CURRENT_DIR/src"

tmux set -g status-left-length 80
tmux set -g status-right-length 150

RESET="#[fg=#a9b1d6,bg=#1A1B26,nobold,noitalics,nounderscore,nodim]"

# Highlight colors
tmux set -g mode-style "fg=pink,bg=#2A2F41"

tmux set -g message-style "bg=#181825,fg=white"
tmux set -g message-command-style "fg=#c0caf5,bg=#414868"

tmux set -g pane-border-style "fg=#2A2F41"
tmux set -g pane-active-border-style "fg=#7aa2f7"
tmux set -g pane-border-status off

tmux set -g status-style bg="default"

TMUX_VARS="$(tmux show -g)"

default_window_id_style="digital"
default_pane_id_style="hsquare"
default_zoom_id_style="dsquare"

# Styles for window numbers
window_id_style="$(echo "$TMUX_VARS" | grep '@tmux_window_id_style' | cut -d" " -f2)"
pane_id_style="$(echo "$TMUX_VARS" | grep '@tmux_pane_id_style' | cut -d" " -f2)"
zoom_id_style="$(echo "$TMUX_VARS" | grep '@tmux_zoom_id_style' | cut -d" " -f2)"
window_id_style="${window_id_style:-$default_window_id_style}"
pane_id_style="${pane_id_style:-$default_pane_id_style}"
zoom_id_style="${zoom_id_style:-$default_zoom_id_style}"

# Set the window number style
window_number="#($SCRIPTS_PATH/custom-number.sh #I $window_id_style)"
custom_pane="#($SCRIPTS_PATH/custom-number.sh #P $pane_id_style)"
zoom_number="#($SCRIPTS_PATH/custom-number.sh #P $zoom_id_style)"


# Widgets for status Bar
current_path="#($SCRIPTS_PATH/path-widget.sh #{pane_current_path})"
# now_playing="#($SCRIPTS_PATH/now-playing.sh)"
# Add netspeed
# Add notification bar


#+--- Bars LEFT ---+
tmux set -g status-left "#[fg=#{?client_prefix,red,blue},bg=default,bold] #{?client_prefix,  ,#[dim]  }#[fg=#{?client_prefix,red,blue} bg=default,bold,nodim]#S  $RESET"
# 󰤂 󰠠
# #2A2B3C
# 
# 
# 

#+--- Windows ---+
# Focus
tmux set -g window-status-current-format "#[fg=#93E2D5,bg=default]   #[fg=#a9b1d6]$window_number #[fg=#93E2D5,bg=default]#{b:pane_current_path}#[nobold,dim]#{?window_zoomed_flag, $zoom_number, $custom_pane} #{?window_last_flag,,} "
# Unfocused
tmux set -g window-status-format "#[fg=#c0caf5,bg=default,none,dim]   $window_number #W#[nobold,dim]#{?window_zoomed_flag, $zoom_number, $custom_pane}#[fg=yellow,blink] #{?window_last_flag,󰁯 ,} "

#+--- Bars RIGHT ---+
tmux set -g status-right "$now_playing $current_path"
tmux set -g window-status-separator "#[fg=#c0caf5,bg=default,none,dim]|"
