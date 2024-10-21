#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias connecteduroam='nmcli con add type wifi con-name "eduroam" ifname wlan0 ssid "eduroam" wifi-sec.key-mgmt wpa-eap 802-1x.identity "elia.cortesi@studenti.unimi.it" 802-1x.password "B4CLVAMY" 802-1x.system-ca-certs yes 802-1x.eap "peap" 802-1x.phase2-auth mschapv2'
alias areyouhappy='echo "yes daddy! UwU"'
alias cred='cat ~/openvpn/credentials.auth'
alias jn='jupyter notebook'
alias mars='java -jar ~/uni/archi2/Mars4_5.jar'
alias dir='echo "This is not Windows, u bigol"'
alias dark='xrandr --output eDP --brightness 0.5'
alias light='xrandr --output eDP --brightness 1'
alias sshpwn='ssh -i ~/.ssh/pwncollege hacker@pwncollege-sep2025.laser.di.unimi.it'
alias gcc='gcc -fpermissive'

# vpn aliases
alias zurigoon='nmcli con up id "Zurigo - Svizzera"'
alias zurigooff='nmcli con down id "Zurigo - Svizzera"'
alias milanoon='nmcli con up id "Milano - Italia"'
alias milanooff='nmcli con down id "Milano - Italia"'
alias romaon='nmcli con up id "Roma - Italia"'
alias romaoff='nmcli con down id "Roma - Italia"'
alias tallinnon='nmcli con up id "Tallinn - Estonia"'
alias tallinnoff='nmcli con down id "Tallinn - Estonia"'
alias berlinoon='nmcli con up id "Berlino - Germania"'
alias berlinooff='nmcli con down id "Berlino - Germania"'
alias islandaon='nmcli con up id "Reykjavik - Islanda"'
alias islandaoff='nmcli con down id "Reykjavik - Islanda"'
alias torontoon='nmcli con up id "Toronto - Canada"'
alias torontooff='nmcli con down id "Toronto - Canada"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
export PS1="\[\033[1m\]\[\033[38;2;137;180;250m\][\u@\h \W]\$ \[\033[0m\]"
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
bash ~/.dotfiles/i3/.config/i3/scripts/keyboard.sh
bash ~/.dotfiles/i3/.config/i3/scripts/update_hdmi_env.sh
export PSQL_EDITOR="/usr/bin/nvim"
export PATH=$PATH:~/.local/bin
