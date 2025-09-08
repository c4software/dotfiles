echo -e "Installing Printer Support"
sudo systemctl enable --now cups.service

# Disable multicast dns in resolved. Avahi will provide this for better network printer discovery
sudo mkdir -p /etc/systemd/resolved.conf.d

if [ ! -f /etc/systemd/resolved.conf.d/10-disable-multicast.conf ]; then
    echo -e "[Resolve]\nMulticastDNS=no" | sudo tee /etc/systemd/resolved.conf.d/10-disable-multicast.conf
fi

sudo systemctl enable --now avahi-daemon.service