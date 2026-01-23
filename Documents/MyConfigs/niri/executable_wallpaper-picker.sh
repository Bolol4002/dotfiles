#!/usr/bin/env bash

WALLDIR="$HOME/Pictures/wallpapers"

# Ensure directory exists
if [ ! -d "$WALLDIR" ]; then
  echo "Wallpaper directory not found: $WALLDIR"
  exit 1
fi

# List wallpapers and pipe into fuzzel
SELECTED=$(ls "$WALLDIR" | fuzzel --dmenu --prompt "Wallpaper: ")

# If nothing selected, exit quietly
[ -z "$SELECTED" ] && exit 0

FILE="$WALLDIR/$SELECTED"

# Set wallpaper with swww
swww img "$FILE" --transition-fps 60 --transition-type grow

# Generate pywal colors
wal -i "$FILE"

# Restart waybar cleanly
pkill waybar
waybar &
disown
