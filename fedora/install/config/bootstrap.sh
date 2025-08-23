#!/bin/bash

echo -e "Déplacement des fichiers de configuration..."

cp -R config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Install Bash configuration
mv ./default/bashrc ~/.bashrc

# Installation de Starship
curl -sS https://starship.rs/install.sh | sh -s -- -b "$HOME/.local/bin"
if ! grep -q 'eval "$(starship init bash)"' ~/.bashrc; then
  echo 'eval "$(starship init bash)"' >>~/.bashrc
fi

# Installation du layout de clavier Bépo Dev
echo "Installing Bépo Dev keyboard layout..."
sudo wget https://raw.githubusercontent.com/c4software/bepo_developpeur/master/linux/bepoDev -O /usr/share/X11/xkb/symbols/bepoDev