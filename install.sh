#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles-mac"

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
