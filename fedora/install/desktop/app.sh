# Installation signal-desktop
echo -e "Installing signal-desktop"
dnf config-manager addrepo --from-repofile=https://download.opensuse.org/repositories/network:im:signal/Fedora_42/network:im:signal.repo
sudo dnf install -y signal-desktop

# Installation de VSCode
echo -e "Installing VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install -y code

# Installation de Google Chrome
echo -e "Installing Google Chrome"
dnf config-manager --set-enabled google-chrome
dnf check-update
dnf install -y google-chrome-stable

# Jetbrains Toolbox
echo -e "Installing Jetbrains Toolbox"
sudo dnf install -y fuse fuse-libs
curl -sL \
    $(curl -s 'https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release' \
        | jq -r '.TBA[0].downloads.linux.link') \
    | tar xzvf - \
        --directory="${HOME}/.local/bin" \
        --wildcards */jetbrains-toolbox \
        --strip-components=1

# Ghostty
dnf copr enable scottames/ghostty
dnf install -y ghostty