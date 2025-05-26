#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @catppuccin_tmux_theme)"

case $SELECTED_THEME in
"mocha")
  declare -A THEME=(
    ["background"]="#1e1e2e"  # Base
    ["foreground"]="#cdd6f4"  # Text
    ["black"]="#45475a"       # Overlay0
    ["blue"]="#89b4fa"        # Blue
    ["cyan"]="#94e2d5"        # Sky
    ["green"]="#a6e3a1"       # Green
    ["magenta"]="#f5c2e7"     # Pink
    ["red"]="#f38ba8"         # Red
    ["white"]="#bac2de"       # Subtext1
    ["yellow"]="#f9e2af"      # Yellow

    ["bblack"]="#585b70"      # Overlay1
    ["bblue"]="#74c7ec"       # Sapphire
    ["bcyan"]="#89dceb"       # Teal
    ["bgreen"]="#94e2d5"      # Green with more saturation
    ["bmagenta"]="#cba6f7"    # Lavender
    ["bred"]="#f38ba8"        # Red
    ["bwhite"]="#cdd6f4"      # Text (brighter white)
    ["byellow"]="#f9e2af"     # Yellow
  )
  ;;

"macchiato")
  declare -A THEME=(
    ["background"]="#24273a"  # Base
    ["foreground"]="#cad3f5"  # Text
    ["black"]="#494d64"       # Overlay0
    ["blue"]="#8aadf4"        # Blue
    ["cyan"]="#91d7e3"        # Sky
    ["green"]="#8bd5ca"       # Green
    ["magenta"]="#f5bde6"     # Pink
    ["red"]="#ed8796"         # Red
    ["white"]="#b8c0e0"       # Subtext1
    ["yellow"]="#eed49f"      # Yellow

    ["bblack"]="#5b6078"      # Overlay1
    ["bblue"]="#7dc4e4"       # Sapphire
    ["bcyan"]="#8bd5ca"       # Teal
    ["bgreen"]="#91d7e3"      # Green with more saturation
    ["bmagenta"]="#c6a0f6"    # Lavender
    ["bred"]="#ed8796"        # Red
    ["bwhite"]="#cad3f5"      # Text (brighter white)
    ["byellow"]="#eed49f"     # Yellow
  )
  ;;

"frappe")
  declare -A THEME=(
    ["background"]="#303446"  # Base
    ["foreground"]="#c6d0f5"  # Text
    ["black"]="#51576d"       # Overlay0
    ["blue"]="#8caaee"        # Blue
    ["cyan"]="#81c8be"        # Sky
    ["green"]="#99d1db"       # Green
    ["magenta"]="#f4b8e4"     # Pink
    ["red"]="#e78284"         # Red
    ["white"]="#b5bfe2"       # Subtext1
    ["yellow"]="#e5c890"      # Yellow

    ["bblack"]="#626880"      # Overlay1
    ["bblue"]="#85c1dc"       # Sapphire
    ["bcyan"]="#89dceb"       # Teal
    ["bgreen"]="#81c8be"      # Green with more saturation
    ["bmagenta"]="#ca9ee6"    # Lavender
    ["bred"]="#e78284"        # Red
    ["bwhite"]="#c6d0f5"      # Text (brighter white)
    ["byellow"]="#e5c890"     # Yellow
  )
  ;;

"latte")
  declare -A THEME=(
    ["background"]="#eff1f5"  # Base
    ["foreground"]="#4c4f69"  # Text
    ["black"]="#5c5f77"       # Overlay0
    ["blue"]="#7287fd"        # Blue
    ["cyan"]="#04a5e5"        # Sky
    ["green"]="#40a02b"       # Green
    ["magenta"]="#ea76cb"     # Pink
    ["red"]="#d20f39"         # Red
    ["white"]="#6c6f85"       # Subtext1
    ["yellow"]="#df8e1d"      # Yellow

    ["bblack"]="#7c7f93"      # Overlay1
    ["bblue"]="#99d1db"       # Sapphire
    ["bcyan"]="#04a5e5"       # Teal
    ["bgreen"]="#7ec06c"      # Green with more saturation
    ["bmagenta"]="#8839ef"    # Lavender
    ["bred"]="#d20f39"        # Red
    ["bwhite"]="#4c4f69"      # Text (darker)
    ["byellow"]="#df8e1d"     # Yellow
  )
  ;;

*)
  # Default to mocha theme if no valid theme is selected
  declare -A THEME=(
    ["background"]="#1e1e2e"
    ["foreground"]="#cdd6f4"
    ["black"]="#45475a"
    ["blue"]="#89b4fa"
    ["cyan"]="#94e2d5"
    ["green"]="#a6e3a1"
    ["magenta"]="#f5c2e7"
    ["red"]="#f38ba8"
    ["white"]="#bac2de"
    ["yellow"]="#f9e2af"

    ["bblack"]="#585b70"
    ["bblue"]="#74c7ec"
    ["bcyan"]="#89dceb"
    ["bgreen"]="#94e2d5"
    ["bmagenta"]="#cba6f7"
    ["bred"]="#f38ba8"
    ["bwhite"]="#cdd6f4"
    ["byellow"]="#f9e2af"
  )
  ;;
esac

THEME['ghgreen']="#3fb950"   # GitHub green
THEME['ghmagenta']="#A371F7" # GitHub magenta
THEME['ghred']="#d73a4a"     # GitHub red
THEME['ghyellow']="#d29922"  # GitHub yellow

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
