#!/bin/bash

level=$(seq 10 10 100 | rofi -dmenu -i -p "Brightness (%)")
[ -z "$level" ] && exit
brightnessctl set "$level%"
