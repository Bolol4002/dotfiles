#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Pick a random wallpaper (supports jpg, jpeg, png, webp)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n1)

if [ -z "$WALLPAPER" ]; then
    echo "autostart.sh: No wallpapers found in $WALLPAPER_DIR" >&2
    exit 1
fi

echo "autostart.sh: Using wallpaper: $WALLPAPER"

# Generate color scheme with pywal16.
# -n skips wal's own wallpaper setter (we handle it with swaybg below).
wal -i "$WALLPAPER" -n -q

# Kill any running swaybg instance and start fresh with the chosen wallpaper.
pkill swaybg 2>/dev/null
sleep 0.2
swaybg -i "$WALLPAPER" -m fill &
disown

# Restart waybar so it sources the freshly generated colors-waybar.css.
pkill waybar 2>/dev/null
sleep 0.3
waybar &
disown
