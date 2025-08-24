# K9s (https://k9scli.io/)
echo -e "Installing K9s"
yay -S --noconfirm k9s

# Install Neovim + LazyVim (https://lazyvim.org/)
echo -e "Installing Neovim + LazyVim"
yay -S --noconfirm neovim luarocks tree-sitter-cli
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
cp -R ./config/nvim/* ~/.config/nvim/
rm -rf ~/.config/nvim/.git
echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua

# Installation de Mise
yay -S --noconfirm mise mariadb-libs postgresql-libs