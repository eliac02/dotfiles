#!/bin/bash
#
#Controlla se HDMI-A-0 è connesso
if xrandr | grep -q "HDMI-A-0 connected"; then
    #Se connesso, imposta la variabile d'ambiente su true
    sed -i '7s/7/12/' /home/elia/.config/alacritty/alacritty.toml
else
    #Se non connesso, imposta la variabile d'ambiente su false
    sed -i '7s/12/7/' /home/elia/.config/alacritty/alacritty.toml
fi

