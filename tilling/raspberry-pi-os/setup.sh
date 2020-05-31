#!/bin/bash

sudo apt install -y bspwm j4-dmenu-desktop feh sxhkd xtitle rxvt-unicode lemonbar bc wmctrl xfonts-terminus
mkdir -p ~/.config/{bspwm,sxhkd,lemonbar}
cp .Xdefaults ~/.Xdefaults