SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Neovim + LazyVim (https://lazyvim.org/)
echo -e "Configuring Neovim + LazyVim"
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
cp -R "$SCRIPT_DIR/../../../common/config/nvim/"* ~/.config/nvim/
rm -rf ~/.config/nvim/.git
echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua

# Ajout des keymaps dans ~/.config/nvim/lua/config/keymaps.lua
# vim.keymap.set("n", "gb", "<C-^>", { desc = "Go to previous buffer" })
echo 'vim.keymap.set("n", "gb", "<C-^>", { desc = "Go to previous buffer" })' >>~/.config/nvim/lua/config/keymaps.lua