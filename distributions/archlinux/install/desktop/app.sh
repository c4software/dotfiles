# VSCode
echo -e "Installing Visual Studio Code"
yay -S --noconfirm visual-studio-code-bin

# Google Chrome Stable
echo -e "Installing Google Chrome Stable"
yay -S --noconfirm google-chrome

# JetBrains Toolbox
echo -e "Installing JetBrains Toolbox"
yay -S --noconfirm jetbrains-toolbox

# Ghostty
echo -e "Installing Ghostty"
yay -S --noconfirm ghostty

# Messaging (Telegram, Signal, Slack)
echo -e "Installing Messaging Apps (Telegram, Signal, Slack)"
yay -S --noconfirm telegram-desktop-bin
yay -S --noconfirm slack-desktop
sudo pacman -S --noconfirm signal-desktop