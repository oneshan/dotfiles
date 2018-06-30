#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Overwrite dotfiles
rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude "macos/" \
  --exclude "bootstrap.sh" \
  --exclude "README.md" \
  -avh --no-perms . ~;
source ~/.bash_profile;

# Install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
