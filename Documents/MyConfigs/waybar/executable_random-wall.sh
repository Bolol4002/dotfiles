#!/usr/bin/env bash

# Directory containing wallpapers
DIR="$HOME/Pictures/wallpapers"

# Pick a random image (supports common formats)
WALL=$(find "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.bmp" \) | shuf -n 1)

# If none found, exit
if [ -z "$WALL" ]; then
  echo "No wallpapers found in $DIR"
  exit 1
fi

echo "Setting wallpaper: $WALL"

# Initialize swww if not running
swww init 2>/dev/null

# Change wallpaper
swww img "$WALL" --transition-type grow --transition-duration 1
wal -i "$WALL"

# Reload waybar so new pywal colors apply
killall -q waybar
waybar &
