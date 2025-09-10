SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if the user has Gnome-shell on his machine.
if command -v gnome-shell >/dev/null; then
  echo -e "Installing Gnome Firmware"
  sudo pacman -S --noconfirm --needed gnome-firmware

  echo -e "Installing Gnome Tweaks"
  sudo pacman -S --noconfirm --needed gnome-tweaks

  echo -e "Installing Gnome Shell Extensions"
  sudo pacman -S --noconfirm --needed gnome-browser-connector

  echo -e "Installing Gnome Extensions CLI" # https://github.com/essembeh/gnome-extensions-cli
  yay -S --noconfirm --needed gnome-extensions-cli

  echo -e "Enable MTP and GVFS"
  sudo pacman -S --noconfirm --needed gvfs-mtp gvfs-mtp gvfs-smb

  # If installation occurs in a graphical environment, else echo the URL
  if [[ $XDG_CURRENT_DESKTOP == "GNOME" ]]; then
    # 3193 : https://extensions.gnome.org/extension/3193/blur-my-shell/
    # 615 : https://extensions.gnome.org/extension/615/appindicator-support/
    # 517 : https://extensions.gnome.org/extension/517/caffeine/
    # 5090 : https://extensions.gnome.org/extension/5090/space-bar/
    # 973 : https://extensions.gnome.org/extension/973/switcher/
    # 4548 : https://extensions.gnome.org/extension/4548/tactile/
    xdg-open "gnome-extensions://blur-my-shell%40aunetx?action=install"
    xdg-open "gnome-extensions://appindicatorsupport%40rgcjonas.gmail.com?action=install"
    xdg-open "gnome-extensions://caffeine%40patapon.info?action=install"
    xdg-open "gnome-extensions://space-bar%40luchrioh?action=install"
    xdg-open "gnome-extensions://switcher%40landau.fi?action=install"
    #xdg-open "gnome-extensions://tactile%40lundal.io?action=install"
  else
    echo "Please visit https://extensions.gnome.org/extension/3193/blur-my-shell/ to install the Blur My Shell extension."
    echo "Please visit https://extensions.gnome.org/extension/615/appindicator-support/ to install the AppIndicator Support extension."
    echo "Please visit https://extensions.gnome.org/extension/517/caffeine/ to install the Caffeine extension."
    echo "Please visit https://extensions.gnome.org/extension/5090/space-bar/ to install the Space Bar extension."
    echo "Please visit https://extensions.gnome.org/extension/973/switcher/ to install the Switcher extension."
    #echo "Please visit https://extensions.gnome.org/extension/4548/tactile/ to install the Tactile extension."
  fi
fi

