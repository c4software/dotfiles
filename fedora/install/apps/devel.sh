# K9s (https://k9scli.io/)
echo -e "Installing K9s"
sudo dnf install -y k9s

# Install Neovim + LazyVim (https://lazyvim.org/)
echo -e "Installing Neovim + LazyVim"
sudo dnf install -y neovim luarocks tree-sitter-cli
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
cp -R ./config/nvim/* ~/.config/nvim/
rm -rf ~/.config/nvim/.git
echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua

# Installation de Mise
echo "Installing Mise (https://mise.jdx.dev/)"
curl https://mise.run | sh