#!bin/bash
#
# This script is used to change the keyboard layout to US when connected to HDMI
if xrandr | grep -q "HDMI-A-0 connected"; then
	setxkbmap us
else
	setxkbmap it
fi
