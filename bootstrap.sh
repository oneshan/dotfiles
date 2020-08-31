#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# Overwrite dotfiles
rsync --exclude ".git/" \
  --exclude ".DS_Store" \
  --exclude "macos/" \
  --exclude "bootstrap.sh" \
  --exclude "README.md" \
  -avh --no-perms . ~;

# Install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall

# Install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
exec $SHELL
