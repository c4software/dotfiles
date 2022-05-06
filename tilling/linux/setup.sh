#!/bin/sh

mkdir -p ~/.config/
cp -r {bspwm,polybar,sxhkd} ~/.config/

yaourt -Sy bspwm j4-dmenu-desktop feh sxhkd xtitle ttf-font-awesome ttf-roboto polybar xtitle scrot i3lock kitty nerd-fonts-sf-mono

echo "exec bspwm" > ~/.xinitrc
