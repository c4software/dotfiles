# Installation des applications terminales
echo -e "Installing terminal applications"
sudo pacman -S --noconfirm --needed fzf ripgrep zoxide bat jq xmlstarlet zip unzip curl wget unrar eza ndu gum  bash-completion btop fastfetch

# Installation de Starship
echo -e "Installing Starship (https://starship.rs/)"
sudo pacman -S --noconfirm --needed starship
if ! grep -q 'eval "$(starship init bash)"' ~/.bashrc; then
  echo -e 'eval "$(starship init bash)"' >>~/.bashrc
fi