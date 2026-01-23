#!/bin/bash

word=$(rofi -dmenu -i -p "Word:")
[ -z "$word" ] && exit

meaning=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$word" | jq -r '.[0].meanings[0].definitions[0].definition' 2>/dev/null)

if [ -z "$meaning" ]; then
    notify-send "Dictionary" "No definition found for '$word'."
else
    notify-send "Dictionary" "$word: $meaning"
fi
