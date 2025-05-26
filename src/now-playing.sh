#!/usr/bin/env bash

# Imports
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
. "${ROOT_DIR}/lib/coreutils-compat.sh"

# Check the global value
# SHOW_MUSIC=$(tmux show-option -gv @tokyo-night-tmux_show_music)
SHOW_MUSIC=$(tmux show-option -gv @tmux_show_music)

if [ "$SHOW_MUSIC" != "1" ]; then
  exit 0
fi

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $CURRENT_DIR/themes.sh

# Colors and symbols
ACCENT_COLOR="${THEME[blue]}"
PLAY_SYMBOL=" "   # Unicode symbol for "playing"
PAUSE_SYMBOL="󰏤"  # Unicode symbol for "paused"

# Function to truncate text to a specified length
truncate_text() {
  local text="$1"
  local length="$2"
  if [ ${#text} -gt $length ]; then
    echo "${text:0:$length}…"
  else
    echo "$text"
  fi
}

# playerctl
if command -v playerctl >/dev/null; then
  PLAYER_STATUS=$(playerctl -a metadata --format "{{status}};{{title}};{{artist}}" | grep -m1 "Playing")
  STATUS="$PLAY_SYMBOL"

  # If no playing media, check for paused media
  if [ -z "$PLAYER_STATUS" ]; then
    PLAYER_STATUS=$(playerctl -a metadata --format "{{status}};{{title}};{{artist}}" | grep -m1 "Paused")
    STATUS="$PAUSE_SYMBOL"
  fi

  TITLE=$(echo "$PLAYER_STATUS" | cut -d';' --fields=2)
  ARTIST=$(echo "$PLAYER_STATUS" | cut -d';' --fields=3)

# nowplaying-cli
elif command -v nowplaying-cli >/dev/null; then
  NPCLI_PROPERTIES=(title artist playbackRate)
  mapfile -t NPCLI_OUTPUT < <(nowplaying-cli get "${NPCLI_PROPERTIES[@]}")
  declare -A NPCLI_VALUES
  for ((i = 0; i < ${#NPCLI_PROPERTIES[@]}; i++)); do
    [ "${NPCLI_OUTPUT[$i]}" = "null" ] && NPCLI_OUTPUT[$i]=""
    NPCLI_VALUES[${NPCLI_PROPERTIES[$i]}]="${NPCLI_OUTPUT[$i]}"
  done
  if [ -n "${NPCLI_VALUES[playbackRate]}" ] && [ "${NPCLI_VALUES[playbackRate]}" -gt 0 ]; then
    STATUS="$PLAY_SYMBOL"
  else
    STATUS="$PAUSE_SYMBOL"
  fi
  TITLE="${NPCLI_VALUES[title]}"
  ARTIST="${NPCLI_VALUES[artist]}"
fi

# Apply character limit
TITLE=$(truncate_text "$TITLE" 20)
ARTIST=$(truncate_text "$ARTIST" 10)

# Output status, artist, and title in blue
if [ -n "$TITLE" ] && [ -n "$ARTIST" ]; then
  echo "#[fg=blue]$STATUS $ARTIST - $TITLE #[fg=default]"
elif [ -n "$TITLE" ]; then
  echo "#[fg=blue]$STATUS $TITLE #[fg=default]"
else
  echo "#[fg=blue]$STATUS No title available #[fg=default]"
fi
