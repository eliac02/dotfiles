#!/bin/bash

# comando per doppio monitor: xrandr --output eDP-1 --auto --output HDMI-1 --auto --right-of eDP-1



INTERNAL_OUTPUT="eDP"
EXTERNAL_OUTPUT="HDMI-A-0"

conf="laptop\ndoppio\nesterno"

chosen=$(echo -e $conf | dmenu -i)

# imposta schermi

case "$chosen" in
 esterno) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary ;; 
 doppio) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT ;;
 laptop) xrandr --output $EXTERNAL_OUTPUT --off --output $INTERNAL_OUTPUT --auto --primary ;; 
esac

# ricarico il wallpaper per evitare errori
exec ~/.fehbg
