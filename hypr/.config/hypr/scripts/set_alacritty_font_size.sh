#!/bin/bash
#
# This script set the right font size of alacritty whene laptop is connected to HDMI monitor

output=$(wlr-randr)
file="/home/elia/.dotfiles/alacritty/.config/alacritty/alacritty.toml"

if echo "$output" | grep -q "HDMI-A-1"; then
	sed -i '7s/7/9/' "$file"
else
	sed -i '7s/9/7/' "$file"
fi
