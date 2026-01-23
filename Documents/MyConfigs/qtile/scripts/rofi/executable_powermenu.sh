#!/bin/bash

choice=$(echo -e "Shutdown\nReboot\nLogout" | rofi -dmenu -i -p "Power Menu")
case "$choice" in
  "Shutdown") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  "Logout") qtile cmd-obj -o cmd -f shutdown ;;
esac
