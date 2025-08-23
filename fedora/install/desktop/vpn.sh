# ProtonVPN
wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm"
sudo dnf install -y ./protonvpn-stable-release-1.0.3-1.noarch.rpm 
sudo dnf check-update --refresh
sudo dnf install -y proton-vpn-gnome-desktop 
