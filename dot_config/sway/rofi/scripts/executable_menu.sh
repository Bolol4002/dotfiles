#!/usr/bin/env bash

# Options
options="Wallpaper Changer\nWifi Menu\nPower Options"

# Choose option
chosen="$(echo -e "$options" | rofi -dmenu -i -p "System Menu" -config /home/sayooj/.config/sway/rofi/config.rasi)"

case "$chosen" in
    "Wallpaper Changer")
        /home/sayooj/.config/sway/rofi/scripts/wallpaper.sh
        ;;
    "Wifi Menu")
        /home/sayooj/.config/sway/rofi/scripts/wifi.sh
        ;;
    "Power Options")
        /home/sayooj/.config/sway/rofi/scripts/power.sh
        ;;
    *)
        exit 0
        ;;
esac
