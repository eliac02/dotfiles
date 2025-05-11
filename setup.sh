#!/bin/bash

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

sudo pacman -S apache bluez bluez-utils brightnessctl cifs-utils curl dunst fastfetch firefox foot  gammastep gimp htop imagemagick lua micro mpv networkmanager npm obs-studio obsidian okular openssh pavucontrol php-apache php-pgsql postgresql prettier python samba scrot starship steam stow stylua tar tcpdump telegram-desktop terminus-font tlp tmux ttf-font-awesome ttf-jetbrains-mono-nerd ttf-terminus-font udiskie unrar unzip waybar wget wlsunset zip
yay -S drawio flameshot-git obs-vkcapture surfshark-client ttf-devicons

