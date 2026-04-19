#!/bin/bash

shopt -s nullglob

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

wallpapers=(
    "$WALLPAPER_DIR"/*.jpg
    "$WALLPAPER_DIR"/*.jpeg
    "$WALLPAPER_DIR"/*.png
    "$WALLPAPER_DIR"/*.gif
)

if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

wal -i "$random_wallpaper" -n
swaybg -m fill -i "$random_wallpaper" &
