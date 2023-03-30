#!/usr/bin/env bash
cd $(dirname "$0")

# Install Homebrew if not installed
if ! hash brew 2>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Run these two commands in your terminal to add Homebrew to your PATH
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/oneshan/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Ask for the administrator password upfront
sudo -v

# Install CLI tools & GUI applications
brew bundle --file=Brewfile

# Remove outdated versions from the cellar
brew cleanup
