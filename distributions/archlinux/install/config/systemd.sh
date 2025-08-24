# Limit journal size to 50MB
echo "SystemMaxUse=50M" | sudo tee -a /etc/systemd/journald.conf

# Prevent systemd-networkd-wait-online timeout on boot
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service