echo -e "Installing Bluetooth packages..."
sudo pacman -S bluez bluez-utils

echo -e "Starting Bluetooth service..."
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service