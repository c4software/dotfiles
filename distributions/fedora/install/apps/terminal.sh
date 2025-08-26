# Installation des applications terminales
echo -e "Installing terminal applications"
sudo dnf install -y fd-find fzf ripgrep zoxide bat jq xmlstarlet zip unzip curl wget unrar eza ncdu gum bash-completion btop fastfetch

# Installation de Starship
curl -sS https://starship.rs/install.sh | sh -s -- -b "$HOME/.local/bin"