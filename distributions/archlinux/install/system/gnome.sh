# Check if the user has Gnome installed, if so install Gnome Specific elements
if pacman -Qs gnome >/dev/null; then
    echo -e "Installing Gnome Firmware"
    sudo pacman -S --noconfirm --needed gnome-firmware

    echo -e "Installing Gnome Tweaks"
    sudo pacman -S --noconfirm --needed gnome-tweaks

    echo -e "Installing Gnome Shell Extensions"
    sudo pacman -S --noconfirm --needed gnome-browser-connector

    # If installation occurs in a graphical environment, else echo the URL
    if [[ $XDG_CURRENT_DESKTOP == "GNOME" ]]; then
        xdg-open https://extensions.gnome.org/extension/3193/blur-my-shell/
        xdg-open https://extensions.gnome.org/extension/615/appindicator-support/
        xdg-open https://extensions.gnome.org/extension/517/caffeine/
    else
        echo "Please visit https://extensions.gnome.org/extension/3193/blur-my-shell/ to install the Blur My Shell extension."
        echo "Please visit https://extensions.gnome.org/extension/615/appindicator-support/ to install the AppIndicator Support extension."
        echo "Please visit https://extensions.gnome.org/extension/517/caffeine/ to install the Caffeine extension."
    fi
fi