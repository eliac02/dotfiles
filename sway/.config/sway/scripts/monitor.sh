#!/bin/sh

# Identifica i monitor con swaymsg
LAPTOP_SCREEN=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | test("eDP")) | .name')
EXTERNAL_SCREEN=$(swaymsg -t get_outputs | jq -r '.[] | select(.name | test("HDMI")) | .name')

if [ -z "$EXTERNAL_SCREEN" ]; then
    notify-send "Nessun monitor esterno rilevato"
    exit 1
fi

# Menu con wofi
entries="󰌽  Laptop\n󰌘  Entrambi\n󰍹  Monitor"
selected=$(echo -e $entries|wofi --dmenu -i -s ~/.dotfiles/wofi/.config/wofi/style.css| awk '{print tolower($2)}')

case $selected in
    laptop)
        swaymsg output "$LAPTOP_SCREEN" enable
        swaymsg output "$EXTERNAL_SCREEN" disable
        ;;
    entrambi)
        swaymsg output "$LAPTOP_SCREEN" enable position 0 0
        swaymsg output "$EXTERNAL_SCREEN" enable position 1920 0
        ;;
    monitor)
        swaymsg output "$LAPTOP_SCREEN" disable
        swaymsg output "$EXTERNAL_SCREEN" enable position 0 0
        ;;
esac
