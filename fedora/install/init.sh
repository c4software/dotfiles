#!/bin/bash

sudo dnf upgrade --refresh

# Activez le dépôt Copr pour lazygit
sudo dnf install -y dnf-plugins-core

# Dépots tiers (pour Google Chrome) cf. https://docs.fedoraproject.org/en-US/workstation-working-group/third-party-repos/
dnf install fedora-workstation-repositories

# Installation des scripts dans ~.local/bin
mkdir -p ~/.local/bin
cp ./bin/* ~/.local/bin/
