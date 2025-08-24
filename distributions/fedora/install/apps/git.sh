# Activez le dépôt Copr pour lazygit
sudo dnf copr enable dejan/lazygit
sudo dnf upgrade --refresh

# Installez git et lazygit
echo -e "Installing git and lazygit"
sudo dnf install -y git lazygit

# Définition des alias git par defaut
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master