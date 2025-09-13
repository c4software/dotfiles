echo -e "Installing Hyprland"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check for --skip-packages flag
if [ "$1" != "--skip-packages" ]; then
    # Install with yay the packages.aur.txt
    yay -S --noconfirm --needed - <"$SCRIPT_DIR/packages.aur.txt"
fi

echo -e "Moving configuration files (replace if exists)"
rm -rf ~/.config/hypr
cp -r "$SCRIPT_DIR/config/"* ~/.config/

echo -e "Moving extra bin scripts"
cp -r "$SCRIPT_DIR/bin/"* ~/.local/bin/

# Set the dark theme for GTK apps
echo -e "Setting dark theme for GTK applications"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
gsettings set org.gnome.desktop.interface icon-theme "Yaru-blue"

# Apply the osaka-jade theme by default
rm -rf ~/.config/theme
omarchy-theme-set "osaka-jade"