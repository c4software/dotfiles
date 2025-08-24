#!/bin/bash

sudo dnf upgrade --refresh

# Activez le dépôt Copr pour lazygit
sudo dnf install -y dnf-plugins-core

# Dépots tiers (pour Google Chrome) cf. https://docs.fedoraproject.org/en-US/workstation-working-group/third-party-repos/
dnf install fedora-workstation-repositories

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y   https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
