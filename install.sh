#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles-mac"

THIS_DIR=$(cd $(dirname $0); pwd)

if if [ ! -d ${DOTFILES_DIR} ]; then
    for f in *
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue
        [[ "$f" == "install.sh" ]] && continue

        ln -snf $DOTFILES_DIR/"$f" $HOME/".$f"
        echo "Installed .$f"
    done
else
    echo "dotfiles already exists"
    exit 1
fi

cd $THIS_DIR

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
