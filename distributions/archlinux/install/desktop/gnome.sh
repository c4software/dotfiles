# Check if the user has Gnome installed, if so install Gnome Specific elements
if pacman -Qs gnome >/dev/null; then
    echo -e "Installing Gnome Firmware"
    yay -S --noconfirm gnome-firmware

    echo -e "Installing Gnome Tweaks"
    yay -S --noconfirm gnome-tweaks

    echo -e "Installing Gnome Shell Extensions"
    yay -S --noconfirm gnome-shell-extensions

    # If installation occurs in a graphical environment, else echo the URL
    if [[ $XDG_CURRENT_DESKTOP == "GNOME" ]]; then
        xdg-open https://extensions.gnome.org/extension/7065/tiling-shell/
    else
        echo "Please visit https://extensions.gnome.org/extension/7065/tiling-shell/ to install the Tiling Shell extension."
    fi
fi