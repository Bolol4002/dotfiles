#!/bin/bash

options="Web Search\nBrightness\nVolume\nDictionary\nPower Menu"
choice=$(echo -e "$options" | rofi -dmenu -i -p "Choose:")

case "$choice" in
  "Web Search") ~/.config/qtile/scripts/rofi/websearch.sh ;;
  "Brightness") ~/.config/qtile/scripts/rofi/brightness.sh ;;
  "Volume") ~/.config/qtile/scripts/rofi/volume.sh ;;
  "Dictionary") ~/.config/qtile/scripts/rofi/dictionary.sh ;;
  "Power Menu") ~/.config/qtile/scripts/rofi/powermenu.sh ;;
  *) exit 1 ;;
esac
