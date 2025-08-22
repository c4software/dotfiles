#!/bin/bash

sudo dnf upgrade --refresh

# Activez le dépôt Copr pour lazygit
sudo dnf copr enable dejan/lazygit

# Installation des paquets
sudo dnf install -y lazygit lazydocker btop fastfetch neovim localsend signal-desktop gum bash-completion