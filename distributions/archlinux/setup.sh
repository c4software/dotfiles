#!/bin/bash

clear

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install de base
source "$SCRIPT_DIR/install/init.sh"

# Download all packages using pacman for install/**/packages.txt
find "$SCRIPT_DIR/install/" -name "packages.txt" -exec sh -c 'grep -v "^#" "$1" | sudo pacman -S --noconfirm --needed -' _ {} \;

# Download all packages using yay for install/**/packages.aur.txt
find "$SCRIPT_DIR/install/" -name "packages.aur.txt" -exec sh -c 'grep -v "^#" "$1" | yay -S --noconfirm --needed -' _ {} \;

# Force the script to be executed from its directory (since init.sh move us to /tmp during yay installation)
cd "$SCRIPT_DIR" || exit

# Add local bin to PATH (since we installed binaries there)
export PATH="$HOME/.local/bin:$PATH"

# Source all script under install/system with confirmation
read -p "Do you want to run system setup scripts? (y/n) " confirm_system
if [[ $confirm_system == [yY] ]]; then
  for script in "$SCRIPT_DIR/install/system/"*.sh; do
    source "$script"
  done
fi

# Source all script under install/apps with confirmation
read -p "Do you want to run apps setup scripts? (y/n) " confirm_apps
if [[ $confirm_apps == [yY] ]]; then
  for script in "$SCRIPT_DIR/install/apps/"*.sh; do
    source "$script"
  done
fi

# Source all scripts under desktop with confirmation
read -p "Do you want to run desktop setup scripts? (y/n) " confirm_desktop
if [[ $confirm_desktop == [yY] ]]; then
  for script in "$SCRIPT_DIR/install/desktop/"*.sh; do
    source "$script"
  done
fi

# Source all scripts under config with confirmation
read -p "Do you want to run config setup scripts? (y/n) " confirm_config
if [[ $confirm_config == [yY] ]]; then
  for script in "$SCRIPT_DIR/install/config/"*.sh; do
    source "$script"
  done
fi

# Asking for user confirmation before enable hyprland
read -p "Do you want to install Hyprland and default configuration? (y/n) " enable_hyprland
if [[ $enable_hyprland == [yY] ]]; then
    source "$SCRIPT_DIR/install/hyprland/setup.sh"
fi