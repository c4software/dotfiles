if lscpu | grep -q "Intel"; then
    sudo pacman -S --noconfirm --needed intel-ucode
elif lscpu | grep -q "AMD"; then
    sudo pacman -S --noconfirm --needed amd-ucode
fi