#!/bin/bash

level=$(seq 0 10 100 | rofi -dmenu -i -p "Volume (%)")
[ -z "$level" ] && exit
pactl set-sink-volume @DEFAULT_SINK@ "$level%"
