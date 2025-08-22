#!/bin/bash

sudo dnf upgrade --refresh

# Activez le dépôt Copr pour lazygit
sudo dnf install -y dnf-plugins-core
sudo dnf copr enable dejan/lazygit
# (optionnel) Ajoutez -y pour répondre automatiquement “yes” si besoin

# Installation des paquets
sudo dnf install -y lazygit lazydocker btop fastfetch neovim localsend signal-desktop

# ProtonVPN
wget "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm"
sudo dnf install ./protonvpn-stable-release-1.0.3-1.noarch.rpm && sudo dnf check-update --refresh
sudo dnf install proton-vpn-gnome-desktop 
