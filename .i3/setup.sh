#!/usr/bin/env bash
# This script installs the necessary apps

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

distrib=$(cat /etc/*-release | grep "^ID=" | cut -d= -f2)
if [[ $distrib = "ubuntu" ]]; then
    function install() { apt-get install $* }
elif [[ $distrib = "arch" ]]; then
    function install() { pacman -S $* }
fi

install i3
install i3status
install conky
pip install i3-py
