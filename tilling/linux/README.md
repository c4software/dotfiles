![My configuration](preview.jpg)

## Requirements
- bspwm
- j4-dmenu-desktop
- feh
- sxhkd
- xtitle
- ttf-font-awesome
- ttf-roboto
- Polybar
- urxvt

## .xinitrc

```
XDG_CONFIG_HOME="$HOME/.config"
sxhkd -m -1 &
exec bspwm
```
