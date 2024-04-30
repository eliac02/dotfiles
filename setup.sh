#!bin/bash
#
# This script is used to setup a good part of my system

echo "Adding multilib support..."
sudo sed -i '92s/#//' /etc/pacman.conf
sudo sed -i '93s/#//' /etc/pacman.conf

echo "Updating system and installing programs..."
sudo pacman -Syu --needed --noconfirm \
	alacritty\
	amd-ucode\
	base-devel\
	cups\
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
	joplin-desktop\
	lua\
	mpv\
	nano\
	neofetch\
	neovim\
	networkmanager\
	okular\
	openssh\
	openvpn\
	postgresql\
	redshift\
	rofi\
	rsync\
	samba\
	scrot\
	steam\
	stow\
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

