echo -e "Installing Hyprland"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install with yay the packages.aur.txt
yay -S --noconfirm --needed - <"$SCRIPT_DIR/packages.aur.txt"

echo -e "Moving configuration files (replace if exists)"
rm -rf ~/.config/hypr
cp -r "$SCRIPT_DIR/config/"* ~/.config/

echo -e "Moving extra bin scripts"
cp -r "$SCRIPT_DIR/bin/"* ~/.local/bin/

echo -e "Move Wallpapers from $SCRIPT_DIR/.config/backgrounds/* to ~/wallpapers"
mkdir -p "$HOME/wallpapers"
cp "$SCRIPT_DIR/config/backgrounds/"* ~/wallpapers/


# Set the dark theme for GTK apps
echo -e "Setting dark theme for GTK applications"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"