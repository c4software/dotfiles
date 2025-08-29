SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if the user has Gnome installed, if so install Gnome Specific elements
if pacman -Qs gnome >/dev/null; then
    echo -e "Installing Gnome Firmware"
    sudo pacman -S --noconfirm --needed gnome-firmware

    echo -e "Installing Gnome Tweaks"
    sudo pacman -S --noconfirm --needed gnome-tweaks

    echo -e "Installing Gnome Shell Extensions"
    sudo pacman -S --noconfirm --needed gnome-browser-connector

    echo -e "Installing Gnome extension-manager"
    yay -S --noconfirm --needed extension-manager

    echo -e "Installing Gnome Extensions CLI" # https://github.com/essembeh/gnome-extensions-cli
    yay -S --noconfirm --needed gnome-extensions-cli

    # If installation occurs in a graphical environment, else echo the URL
    if [[ $XDG_CURRENT_DESKTOP == "GNOME" ]]; then
        gext install 3193 615 517 3843 5090 973 4548
    else
        echo "Please visit https://extensions.gnome.org/extension/3193/blur-my-shell/ to install the Blur My Shell extension."
        echo "Please visit https://extensions.gnome.org/extension/615/appindicator-support/ to install the AppIndicator Support extension."
        echo "Please visit https://extensions.gnome.org/extension/517/caffeine/ to install the Caffeine extension."
        echo "Please visit https://extensions.gnome.org/extension/3843/just-perfection/ to install the Just Perfection extension."
        echo "Please visit https://extensions.gnome.org/extension/5090/space-bar/ to install the Space Bar extension."
        echo "Please visit https://extensions.gnome.org/extension/973/switcher/ to install the Switcher extension."
        echo "Please visit https://extensions.gnome.org/extension/4548/tactile/ to install the Tactile extension."
    fi

    # TODO restore extensions configuration
    # dconf load /org/gnome/shell/extensions/ < $SCRIPT_DIR/../../gnome-extensions-settings.conf

fi