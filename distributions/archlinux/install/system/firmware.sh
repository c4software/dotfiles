sudo pacman -S --noconfirm fwupd

if lscpu | grep -q "Intel"; then
    sudo pacman -S --noconfirm intel-ucode
elif lscpu | grep -q "AMD"; then
    sudo pacman -S --noconfirm amd-ucode
fi