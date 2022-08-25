#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

cd "$(dirname "${BASH_SOURCE}")";

# Overwrite dotfiles
rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude "macos/" \
  --exclude "bootstrap.sh" \
  --exclude "README.md" \
  -avh --no-perms . ~;

# Install oh-my-zsh and plugins
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chown -R $(whoami) ~/.oh-my-zsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

if [ "$(uname)" == "Darwin"]; then
  # Install Homebrew
  sh macos/brew.sh
  # Import customized utility
  sh macos/utility.sh
fi

# Install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# Refresh the terminal with updated shell
exec $SHELL
