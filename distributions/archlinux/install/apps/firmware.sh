yay -S --noconfirm fwupd

if lscpu | grep -q "Intel"; then
    yay -S --noconfirm intel-ucode
elif lscpu | grep -q "AMD"; then
    yay -S --noconfirm amd-ucode
fi

# Check if the user has Gnome installed, if so install gnome-firmware (UI pour fwupd)
if pacman -Qs gnome >/dev/null; then
    yay -S --noconfirm gnome-firmware
fi