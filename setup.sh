#!/bin/bash
#
# This script is used to setup a good part of my system

echo "Updating system and installing programs..."
sudo pacman -Syu --needed --noconfirm \
	cups\
	curl\
	docker\
	flameshot\
	gimp\
	gradle\
	grep\
	imagemagick\
	mpv\
	neofetch\
	networkmanager\
	okular\
	openvpn\
	postgresql\
	redshift\
	rsync\
	samba\
	scrot\
	steam\
	tar\
	telegram-desktop\
	unzip\
	wget\
	wine\
	zip\

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
echo "yay installed"

yay -S --needed --noconfirm \
	drawio-desktop\
	pokemmo\
	joplin-desktop
