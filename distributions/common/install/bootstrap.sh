#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo -e "Déplacement des fichiers de configuration..."

cp -R "$SCRIPT_DIR/../config/"* ~/.config/

# Ensure local bin exists
mkdir -p ~/.local/bin

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Installation des scripts dans ~.local/bin
mkdir -p ~/.local/bin
cp "$SCRIPT_DIR/../bin/"* ~/.local/bin/

# Install Bash configuration
cp "$SCRIPT_DIR/../default/bashrc" ~/.bashrc

# If not MacOS
if [[ "$OSTYPE" != "darwin"* ]]; then
  # Installation du layout de clavier Bépo Dev
  echo "Installing Bépo Dev keyboard layout (Système)..."
  sudo wget -nc https://raw.githubusercontent.com/c4software/bepo_developpeur/master/linux/bepoDev -O /usr/share/X11/xkb/symbols/bepoDev || true

  # Installation bepoDev pour l'utilisateur
  echo "Installing Bépo Dev keyboard layout (Utilisateur)..."
  mkdir -p ~/.config/xkb/symbols ~/.config/xkb/rules || true
  wget https://raw.githubusercontent.com/c4software/bepo_developpeur/master/linux/bepoDev -O ~/.config/xkb/symbols/bepoDev || true
  wget https://raw.githubusercontent.com/c4software/bepo_developpeur/master/linux/evdev.lst -O ~/.config/xkb/rules/evdev.lst || true
  wget https://raw.githubusercontent.com/c4software/bepo_developpeur/master/linux/evdev.xml -O ~/.config/xkb/rules/evdev.xml || true
  [ -L ~/.config/xkb/rules/base.lst ] || ln -s ~/.config/xkb/rules/evdev.lst ~/.config/xkb/rules/base.lst || true
  [ -L ~/.config/xkb/rules/base.xml ] || ln -s ~/.config/xkb/rules/evdev.xml ~/.config/xkb/rules/base.xml || true
fi