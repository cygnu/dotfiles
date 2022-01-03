#!/bin/bash

echo "Installing Homebrew ..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Run brew doctor ..."
which brew >/dev/null 2>&1 && brew doctor

echo "Run brew update ..."
brew update

echo "Ok. Run brew upgrade ..."
brew upgrade

brew bundle

brew cleanup
