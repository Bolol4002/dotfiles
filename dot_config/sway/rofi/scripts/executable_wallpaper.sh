#!/usr/bin/env bash

# Directories
WALLPAPER_DIR="/home/sayooj/.config/sway/wallpapers"
ROFI_CONFIG="/home/sayooj/.config/sway/rofi/config.rasi"

# Get a list of files and format for rofi with icons if supported
# Rofi -show-icons works best for thumbnails, but for dmenu we use \0icon\x1fPATH
options=""
while IFS= read -r file; do
    options+="${file}\0icon\x1f${WALLPAPER_DIR}/${file}\n"
done < <(ls "$WALLPAPER_DIR" | grep -Ei "\.(png|jpg|jpeg|webp)$")

selected=$(echo -en "$options" | rofi -dmenu -i -p "Select Wallpaper" -config "$ROFI_CONFIG" -show-icons)

if [[ -n "$selected" ]]; then
    WALLPAPER_PATH="$WALLPAPER_DIR/$selected"
    
    # Use swaymsg to change wallpaper (fill mode)
    swaymsg "output * bg \"$WALLPAPER_PATH\" fill"
    
    # Notify user
    notify-send "Wallpaper" "Applied: $selected"
fi
