#!/usr/bin/env bash
# rofi_system_menu.sh

list=(
  "Suspend"     "systemctl suspend"
  "Reboot"      "systemctl reboot"
  "Shutdown"    "systemctl poweroff"
)

for (( i=1; i<=$((${#list[@]}/2)); i++ )); do
  [[ -z "$@" ]] && echo "${i}. ${list[$i*2-2]}" && continue
  [[ "$@" == "${i}. ${list[$i*2-2]}" ]] && command="${list[$i*2-1]}" && break
done
eval "${command:-:}"
