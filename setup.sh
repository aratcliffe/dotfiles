#!/bin/zsh

echo "Setting up your Mac..."

# Ask for the administrator password upfront
sudo -v

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
brew tap homebrew/cask-versions
brew bundle --file ./Brewfile

# Symlinks dotfiles to ~/ 
source ./makesymlinks.sh

# Set macOS preferences - we will run this last because this will reload the shell
source ./macos.sh

echo "Setup complete!"
