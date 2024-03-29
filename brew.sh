#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install gh
brew install git
brew install httpie

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
#brew install exiv2
brew install git
brew install rename
brew install ssh-copy-id
brew install tree
brew install htop
brew install telnet

# Kubernetes stuff
brew install kubernetes-cli
brew install krew

# Remove outdated versions from the cellar.
brew cleanup
