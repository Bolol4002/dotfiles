#!/bin/sh

# Get a random wallpaper
wall=$(find ~/Pictures/wallpapers -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

# Exit if no wallpaper is found
[ -z "$wall" ] && echo "No wallpapers found!" && exit 1

# Clear previous pywal colors
wal -c

# Generate new pywal colors
wal -i "$wall"

# Set wallpaper using xwallpaper
xwallpaper --zoom "$wall"

ln -sf ~/.cache/wal/colors-rofi-dark.rasi ~/.config/rofi/colors.rasi

# xdotool to set the pywal in qtile
xdotool key --clearmodifiers ctrl+super+r

# Optional: restart notification daemon
pgrep dunst && pkill dunst && dunst &

# Optional: restart any other bar or script if needed
# /home/sayooj/.config/suckless/scripts/dwmbar &
