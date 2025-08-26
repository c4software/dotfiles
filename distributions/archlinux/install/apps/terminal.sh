# Installation des applications terminales
echo -e "Installing terminal applications"
yay -S --noconfirm fd-find fzf ripgrep zoxide bat jq xmlstarlet zip unzip curl wget unrar eza ncdu gum bash-completion btop fastfetch

# Installation de Starship
echo -e "Installing Starship (https://starship.rs/)"
sudo pacman -S --noconfirm starship
if ! grep -q 'eval "$(starship init bash)"' ~/.bashrc; then
  echo -e 'eval "$(starship init bash)"' >>~/.bashrc
fi