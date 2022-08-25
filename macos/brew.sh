#!/usr/bin/env bash
cd $(dirname "$0")

# Install Homebrew if not installed
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Ask for the administrator password upfront
sudo -v

# Install CLI tools & GUI applications
brew bundle --file=Brewfile

# Remove outdated versions from the cellar
brew cleanup && brew prune
