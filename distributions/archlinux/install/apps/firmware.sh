yay -S --noconfirm fwupd

if lscpu | grep -q "Intel"; then
    yay -S --noconfirm intel-ucode
elif lscpu | grep -q "AMD"; then
    yay -S --noconfirm amd-ucode
fi