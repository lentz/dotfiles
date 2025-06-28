#!/bin/bash -eu

brew bundle

mkdir -p ~/.config
ln -nsf ~/.dotfiles/config/tmux ~/.config/tmux
ln -nsf ~/.dotfiles/config/nvim ~/.config/nvim
ln -nsf ~/.dotfiles/config/ghostty ~/.config/ghostty
ln -nsf ~/.dotfiles/config/git ~/.config/git
ln -nsf ~/.dotfiles/config/homebrew ~/.config/homebrew

ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/aliases.sh ~/.aliases.sh
ln -sf ~/.dotfiles/git-prompt.sh ~/.git-prompt.sh

echo "Setup FZF shell integration"
/opt/homebrew/opt/fzf/install --no-bash --no-fish --no-update-rc

brew bundle

echo "Installing Language Servers"
npm install --global \
  @microsoft/compose-language-service \
  dockerfile-language-server-nodejs \
  vscode-langservers-extracted \
  typescript-language-server \
  @angular/language-server

echo "Complete!"
