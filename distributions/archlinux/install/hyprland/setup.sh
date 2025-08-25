echo -e "Installing Hyprland"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

yay -S --noconfirm --needed \
  hyprland hyprshot hyprpicker hyprlock hypridle polkit-gnome hyprland-qtutils \
  walker-bin libqalculate waybar mako swaybg swayosd \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  wiremix pamixer blueberry

echo -e "Moving configuration files"
cp -r "$SCRIPT_DIR/config/*" ~/.config/

echo -e "Moving extra bin scripts"
cp -r "$SCRIPT_DIR/bin/*" ~/.local/bin/
