#!/bin/bash

INT="eDP-1"
EXT="HDMI-A-1"

conf="laptop\nesterno"

chosen=$(echo -e $conf | wofi --dmenu)

reset=$(wlr-randr --output $INT --on --output $EXT --on)

# imposta schermi

case "$chosen" in
 esterno) 
	 $reset
    wlr-randr --output $EXT --mode 1920x1080 --pos 0,0 --output $INT --off ;;
 laptop) 
	 $reset
    wlr-randr --output $INT --mode 1920x1080 --pos 0,0 --output $EXT --off ;;
esac
