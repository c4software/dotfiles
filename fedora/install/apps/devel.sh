#!/bin/bash

# Installation de VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code

# K9s
sudo dnf install -y k9s

# Neovim
sudo dnf install -y neovim luarocks tree-sitter-cli

# Install LazyVim
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
cp -R ./config/nvim/* ~/.config/nvim/
rm -rf ~/.config/nvim/.git
echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua

# Installation de Mise 
curl https://mise.run | sh

# Jetbrains Toolbox
sudo dnf install -y jq fuse fuse-libs
curl -sL \
    $(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' \
        | jq -r '.TBA[0].downloads.linux.link') \
    | tar xzvf - \
        --directory="${HOME}/.local/bin" \
        --wildcards */jetbrains-toolbox \
        --strip-components=1