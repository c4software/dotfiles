# Installation des applications terminales
echo -e "Installing terminal applications"
sudo pacman -S --noconfirm --needed tldr fzf ripgrep zoxide bat jq xmlstarlet zip unzip curl wget unrar eza ndu gum bash-completion btop fastfetch zellij yazi

# Installation de Starship
echo -e "Installing Starship (https://starship.rs/)"
sudo pacman -S --noconfirm --needed starship

