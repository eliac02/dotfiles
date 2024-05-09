#!/bin/bash
#
# This script is used to setup a good part of my system

get_api_key() {
    while [! -d "/run/media/$USER"]; do
        echo "Inserisci la USB-KEY..."
        read -p "Premi ENTER una volta inserita."
    done

    cd "/run/media/$USER" || exit

    if [! -f "api_key_client_secret.cred"]; then
        echo "File chiave non trovato."
        exit 1
    fi

    KEY=
}

sudo pacman -Syu --needed --noconfirm \
    git\
    github-cli\
    openssh\
    base-devel\
    samba\
    bitwarden-cli\
    stow\
    expect

spawn bw login
expect "API"
API_KEY_BW=get_api_key()
send $API_KEY_BW
bw unlock
bw sync

HOME="/home/elia"
echo "Retrieving email..."
MAIL=$(bw get note email)
NAME="eliacortesi"
DOTFILES="git@github.com:eliac02/dotfiles.git"
echo "Retrieving SSH passphrase..."
PASSPHRASE_SSH=$(bw get note SSH)
echo "Retrieving new Github token..."
TOKEN_GH=$(bw get note token)

bw lock

echo "Generating ssh key in order to clone repo from Github..."
cd ~
mkdir .ssh
ssh-keygen -t ed25519 -C $MAIL -f $HOME/.ssh/id_ed25519 -N $PASSPHRASE_SSH
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Ssh key generated."

echo "Adding ssh key into github account..."
gh auth login --with-token $TOKEN_GH
gh ssh-key add $HOME/.ssh/id_ed25519.pub --type authentication --title "arch-elia"
echo "Ssh added to github account."

echo "Cloning dotfies from github..."
cd ~
mkdir .dotfiles
cd .dotfiles
git init
git config user.email $MAIL
git config user.name $NAME
spawn git pull origin master
expect "Enter passphrase"
send $PASSPHRASE_SSH
expect eof
echo "Dotfiles retrieved."

echo "Using stow to spread dotfiles..."
cd ~/.dotfiles
rm ~/.config/i3 && stow i3
stow -t /etc/ i3status
stow nvim
stow rofi
rm ~/.bashrc && stow bash && . ~/.bashrc
stow dunst
rm ~/.config/\`Bitwarden CLI\`/ && stow bwcli
echo "Dotfiles installed."

echo "Adding multilib support in pacman..."
sudo sed -i '89s/#//' /etc/pacman.conf
sudo sed -i '90s/#//' /etc/pacman.conf
echo "Multilib added."

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

echo "Packages installed."

echo "Installing yay"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
echo "Yay installed."

echo "Installing yay packages..."
yay -Syu --needed --no-confirm \
    drawio-desktop\
    pokemmo\
    fastfetch\
    joplin-desktop

echo "Packages installed."

echo "Installing catppuccin theme for sddm login manager..."
cd ~/.dotfiles/theme/sddm/
sudo unzip catppuccin-mocha.zip -d /usr/share/sddm/themes/
sudo cp sddm.conf /etc/
echo "Theme installed."

echo "Installing catppuccin theme for grub..."
cd ~/.dotfiles/theme/grub
sudo cp -r catppuccin-mocha-grub-theme /usr/share/grub/themes/
sudo sed '47cGRUB_THEME="/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt"' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
echo "Theme installed."

sudo reboot now
