# Installation de Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installation des applications
brew tap oven-sh/bun
brew install mc bash lazygit neovim unrar htop bun php pnpm lazydocker git fzf zoxide eza bash-completion bat fd ripgrep jq

# Setup PNPM
pnpm add -g corepack
pnpm env use --global lts

# No Hide Delay Dock
defaults write com.apple.dock autohide -bool true 
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.2
killall Dock

# Installation d'applications supplémentaires
brew install --cask orbstack
brew install --cask visual-studio-code
brew install --cask postman
brew install --cask google-chrome
brew install --cask ghostty
brew install --cask kitty
brew install --cask jetbrains-toolbox
brew install --cask telegram
brew install --cask signal-desktop

# Font echo "Installing System Extra Fonts"
brew tap homebrew/cask-fonts
brew install --cask \
  font-fontawesome \
  font-cascadia-code-nerd-font \
  font-ia-writer-duospace \
  font-noto \
  font-noto-emoji \
  font-jetbrains-mono-nerd-font \
  font-noto-sans-cjk \
  font-noto-sans \
  font-noto-serif

# Set bash as default shell
chsh -s /bin/bash
