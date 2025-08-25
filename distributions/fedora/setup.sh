#!/bin/bash

clear

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/install/init.sh"
# Add local bin to PATH (since we installed binaries there)
export PATH="$HOME/.local/bin:$PATH"

# Source all script under install/apps
for script in "$SCRIPT_DIR/install/apps/"*.sh; do
  source "$script"
done

# Source all scripts under desktop
for script in "$SCRIPT_DIR/install/desktop/"*.sh; do
  source "$script"
done

# Asking for user confirmation before enable hyprland
#read -p "Do you want to install Hyprland and default configuration? (y/n) " enable_hyprland
# if [[ $enable_hyprland == [yY] ]]; then
#   source "$SCRIPT_DIR/install/hyprland/setup.sh"
# fi