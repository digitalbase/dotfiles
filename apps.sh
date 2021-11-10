# Software packages through cask

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install cask
brew tap homebrew/cask

# System Utils
brew install bartender
brew install viscosity
brew install iterm2

# Used utilities
brew install google-chrome
brew install firefox
brew install zoom
brew install alfred
brew install slack
brew install 1password
brew install vlc
brew install spotify
brew install appcleaner
brew install whatsapp
brew install twitter
brew install figma
brew install notion
brew install steam
brew install linear-linear
brew install brave-browser
# https://www.macsparky.com/blog/2021/2/hyper-key-via-bettertouchtool instead of karabiner
brew install bettertouchtool

# Dev stuff
brew install visual-studio-code
brew install phpstorm
brew install iterm2
brew install postman

# Fonts (coding)
brew tap homebrew/cask-fonts
brew install font-inconsolata
brew install font-inconsolata-dz-for-powerline
brew install font-inconsolata-for-powerline-bold
brew install font-inconsolata-for-powerline
brew install font-inconsolata-g-for-powerline
brew install font-inconsolata-g

## Needed for source code pro
brew install svn
brew install font-source-code-pro
ViewvViewv

###############################################################################
# Mac App Store Apps                                                          #
###############################################################################

# Command line interface for the Mac App Store
# This command will not allow you to install an app for the first time: it must
# already be in the Purchased tab of the App Store.
brew install mas

#mas install 409201541	# install Pages
#mas install 409203825	# install Numbers
#mas install 409183694	# install Keynote
mas install 1482454543	# install Twitter
mas install 1091189122	# install Bear

brew cleanup
