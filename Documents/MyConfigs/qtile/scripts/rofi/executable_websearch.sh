#!/bin/bash

engine=$(echo -e "Google\nReddit\nPerplexity\nChatGPT" | rofi -dmenu -i -p "Search Engine:")
[ -z "$engine" ] && exit

query=$(rofi -dmenu -i -p "Search Query:")
[ -z "$query" ] && exit

case "$engine" in
  "Google") xdg-open "https://www.google.com/search?q=$query" ;;
  "Reddit") xdg-open "https://www.reddit.com/search/?q=$query" ;;
  "Perplexity") xdg-open "https://www.perplexity.ai/search?q=$query" ;;
  "ChatGPT") xdg-open "https://chat.openai.com/chat" ;;
esac
