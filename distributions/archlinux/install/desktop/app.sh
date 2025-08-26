# VSCode
echo -e "Installing Visual Studio Code"
yay -S --noconfirm --needed visual-studio-code-bin

# Google Chrome Stable
echo -e "Installing Google Chrome Stable"
yay -S --noconfirm --needed google-chrome

# JetBrains Toolbox
echo -e "Installing JetBrains Toolbox"
yay -S --noconfirm --needed jetbrains-toolbox

# Ghostty
echo -e "Installing Ghostty"
sudo pacman -S --noconfirm --needed --needed ghostty

# Messaging (Telegram, Signal, Slack)
echo -e "Installing Messaging Apps (Telegram, Signal, Slack)"
yay -S --noconfirm --needed telegram-desktop-bin
yay -S --noconfirm --needed slack-desktop
sudo pacman -S --noconfirm --needed signal-desktop