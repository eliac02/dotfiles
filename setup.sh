#!/bin/bash
#
# This script is used to setup a good part of my system

mail="eliacortei278@gmail.com"
name="eliacortesi"
dotfiles="git@github.com:eliac02/dotfiles.git"

sudo pacman -Syu --needed --noconfirm \
    git\
    base-devel\
    openssh\
    stow\

ssh-keygen -t ed25519 -C $mail

cd ~
mkdir .dotfiles
cd .dotfiles
git init
git config user.email $email
git config user.name $name
git clone $dotfiles

echo "Updating system and installing programs..."
sudo pacman -Syu --needed --noconfirm \
    alacritty\
    amd-ucode\
    base\
    base-devel\
    cifs-utils\
	curl\
	docker\
    feh\
    firefox\
	flameshot\
	gimp\
    git\
	gradle\
	grep\
    htop\
	imagemagick\
    lua\
    luarocks\
	mpv\
    neovim\
	networkmanager\
    npm\
	okular\
    openssh\
	openvpn\
	postgresql\
	redshift\
    rofi\
	rsync\
	samba\
	scrot\
    starship\
	steam\
    stow\
	tar\
	telegram-desktop\
	unzip\
	wget\
	wine\
    xorg-xev\
	zip\

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
echo "Yay installed"

yay -Syu --needed --no-confirm \
    drawio-desktop\
    pokemmo\
    fastfetch
