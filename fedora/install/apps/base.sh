#!/bin/bash

sudo dnf upgrade --refresh

# Activez le dépôt Copr pour lazygit
sudo dnf copr enable dejan/lazygit

# Ajout dépôt pour signal-desktop
dnf config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/network:im:signal/Fedora_42/network:im:signal.repo

# Installation des paquets
sudo dnf install -y lazygit lazydocker btop fastfetch neovim signal-desktop gum bash-completion