#!/bin/bash

# install homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null

# Add brew to path
echo "Adding brew to path..."
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/vscode/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Run brew upgrade and brew cleanup.
echo "Running brew upgrade and brew cleanup..."
brew upgrade && brew cleanup

# Install bundle using Homebrew
echo "Installing bundle using Homebrew..."
brew bundle --file=.devcontainer/Brewfile

# Run brew doctor.
brew doctor

# Brew version.
echo "Brew versions:"
brew --version

# Brew package versions:
echo "Brew package versions:"
brew list --versions

