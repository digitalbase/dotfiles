# Software packages through cask

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install cask
brew tap caskroom/cask

# System Utils
brew cask install bartender
brew cask install viscosity
brew cask install iterm2

# Used utilities
brew cask install google-chrome
brew cask install firefox
brew cask install zoom
brew cask install alfred
brew cask install slack
brew cask install 1password
brew cask install vlc
brew cask install spotify
brew cask install appcleaner
brew cask install whatsapp
brew cask install twitter
brew cask install figma
brew cask install notion
brew cask install steam
brew cask install linear-linear
# https://www.macsparky.com/blog/2021/2/hyper-key-via-bettertouchtool instead of karabiner
brew cask install bettertouchtool

# Dev stuff
brew cask install visual-studio-code
brew cask install phpstorm
brew cask install iterm2
brew cask install postman

# Fonts (coding)
brew tap homebrew/cask-fonts
brew cask install font-inconsolata
brew cask install font-inconsolata-dz-for-powerline
brew cask install font-inconsolata-for-powerline-bold
brew cask install font-inconsolata-for-powerline
brew cask install font-inconsolata-g-for-powerline
brew cask install font-inconsolata-g

