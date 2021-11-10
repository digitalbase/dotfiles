
###############################################################################
# Dock
# From https://github.com/albertoqa/dotfiles/blob/master/bin/macos.sh
###############################################################################

echo "Configuring dock preferences"

# Set the icon size of Dock items to 34 pixels
defaults write com.apple.dock tilesize -int 34

# Change minimize/maximize window effect to Scale effect
defaults write com.apple.dock mineffect -string "scale"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Turn off magnification
defaults write com.apple.dock magnification -boolean NO

# remove all icons from the dock
defaults write com.apple.dock persistent-apps -array