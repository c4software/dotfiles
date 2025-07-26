rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
cp -R ./config/* ~/.config/nvim/
rm -rf ~/.config/nvim/.git
echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua
