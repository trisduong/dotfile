#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Create a projects directories
mkdir $HOME/Code
mkdir $HOME/Code/work
mkdir $HOME/Code/Test

# Clone Github repositories
./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/dot/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/dot/.skhdrc $HOME/.skhdrc
ln -s $HOME/.dotfiles/dot/.yabairc $HOME/.yabairc
ln -s $HOME/.dotfiles/dot/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zsh/aliases.zsh $HOME/.oh-my-zsh/custom/aliases.zsh
ln -s $HOME/.dotfiles/zsh/path.zsh $HOME/.oh-my-zsh/custom/path.zsh

# setup important config
mkdir -p $HOME/.config
ln -s $HOME/.dotfiles/config/alacritty $HOME/.config/alacritty
ln -s $HOME/.dotfiles/config/karabiner $HOME/.config/karabiner
ln -s $HOME/.dotfiles/config/nvim $HOME/.config/nvim

yabai --start-service
skhd --start-service

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

# note: icon, source alias, role for karabiner, 1password, config
