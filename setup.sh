#!/bin/bash
#
# This script is used to setup a good part of my system


HOME="/home/elia"
MAIL="eliacortesi278@gmail.com"
NAME="eliacortesi"
DOTFILES="git@github.com:eliac02/dotfiles.git"
PASSPHRASE_SSH=

sudo pacman -Syu --needed --noconfirm \
    git\
    github-cli\
    openssh\
    base-devel\
    samba\
    bitwarden-cli\
    stow

echo "Generating ssh key in order to clone repo from Github..."
cd ~
mkdir .ssh
ssh-keygen -t ed25519 -C $MAIL -f $HOME/.ssh/id_ed25519 -N $PASSPHRASE_SSH
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

gh auth login --with-token $TOKEN_GH
gh ssh-key add $HOME/.ssh/id_ed25519.pub --type authentication --title "arch-elia"

cd ~
mkdir .dotfiles
cd .dotfiles
git init
git config user.email $MAIL
git config user.name $NAME
git clone $DOTFILES

#stow

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
echo "Yay installed."

yay -Syu --needed --no-confirm \
    drawio-desktop\
    pokemmo\
    fastfetch\
    joplin-desktop

echo "Installing catppuccin theme for sddm login manager..."
cd ~/.dotfiles/theme/sddm/
sudo unzip catppuccin-mocha.zip -d /usr/share/sddm/themes/
sudo mv sddm.conf /etc/

