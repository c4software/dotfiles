#!/bin/bash

clear

source ./install/init.sh
source ./install/config/bootstrap.sh

# Source all script under install/apps
for script in ./install/apps/*.sh; do
  source "$script"
done

# Source all scripts under desktop
for script in ./install/desktop/*.sh; do
  source "$script"
done

# Installation des WebApps de base
source ./install/config/webapp.sh

# Asking for user confirmation before enable hyprland
#read -p "Do you want to install Hyprland and default configuration? (y/n) " enable_hyprland
# if [[ $enable_hyprland == [yY] ]]; then
#   source ./install/hyprland/setup.sh
# fi