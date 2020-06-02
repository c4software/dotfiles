#!/bin/bash

echo "# Install packages"
sudo apt install -y bspwm j4-dmenu-desktop feh sxhkd xtitle rxvt-unicode lemonbar bc wmctrl xfonts-terminus
mkdir -p ~/.config/{bspwm,sxhkd,lemonbar}

echo "Copy configurations files"
cp .Xdefaults ~/.Xdefaults
cp lemonbar/panel.sh ~/.config/lemonbar/panel.sh