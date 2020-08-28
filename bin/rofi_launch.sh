#!/bin/bash
# rofi_launch.sh

alpha="cc"   # opacity (00〜FF)

options=(
  -modi            "drun,system:${HOME}/bin/rofi_system_menu.sh,calc:qalc,ssh"
  -combi-modi      "drun"
  -show            "drun"
  -font            "monospace 16"
  -width           "60"
  -padding         "40"
  -lines           "10"
  -fixed-num-lines
  -hide-scrollbar
  -sidebar-mode

  ##  key bindings  ##
  -kb-cancel        "Escape,Control+g,Control+bracketleft,Control+c"
  -kb-mode-next     "Shift+Right,Control+i,Control+Tab"
  -kb-mode-previous "Shift+Left,Control+Shift+i"

  #### color scheme
  -color-enabled   "true"
  ## window         bg                   border               separator
  -color-window    "argb:${alpha}040404, argb:${alpha}040404, argb:${alpha}458588"
  ## text & cursor  bg             fg                   bg (alt)       bg (highlight)       fg (highlight)
  -color-normal    "argb:00000000, argb:${alpha}458588, argb:00000000, argb:${alpha}076678, argb:${alpha}83a598"
  -color-active    "argb:00000000, argb:${alpha}689d6a, argb:00000000, argb:${alpha}427b58, argb:${alpha}8ec07c"
  -color-urgent    "argb:00000000, argb:${alpha}b16286, argb:00000000, argb:${alpha}8f3f71, argb:${alpha}d3869b"
)

rofi "$@" "${options[@]}"
