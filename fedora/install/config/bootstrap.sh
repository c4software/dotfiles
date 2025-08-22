#!/bin/bash

echo "Moving configuration files..."

cp -R config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master

# Install Bash configuration
mv ./default/bashrc ~/.bashrc

# Installation de Starship
curl -sS https://starship.rs/install.sh | sh -s -- -b "$HOME/.local/bin"
if ! grep -q 'eval "$(starship init bash)"' ~/.bashrc; then
  echo 'eval "$(starship init bash)"' >>~/.bashrc
fi