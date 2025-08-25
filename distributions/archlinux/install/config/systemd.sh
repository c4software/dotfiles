# Limit journal size to 50MB if not already set
if ! grep -q "^SystemMaxUse=50M" /etc/systemd/journald.conf; then
    echo "SystemMaxUse=50M" | sudo tee -a /etc/systemd/journald.conf
fi

# Prevent systemd-networkd-wait-online timeout on boot
sudo systemctl disable systemd-networkd-wait-online.service
sudo systemctl mask systemd-networkd-wait-online.service