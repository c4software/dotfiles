# Alacritty
echo -e "Installing Alacritty"
sudo dnf install -y alacritty

dnf copr enable solopasha/hyprland

# Hyprland
echo -e "Installing Hyprland tools"
sudo dnf install -y hyprland hyprshot hyprpicker hyprlock hypridle hyprsunset waybar swaybg xdg-desktop-portal-gtk mako hyprland-qtutils rofi uwsm
