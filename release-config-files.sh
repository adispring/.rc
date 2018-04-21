#!/bin/bash

dotfiles=(".zshrc" ".bashrc" ".spacemacs.d")
for file in ${dotfiles[@]}
do
    cp -rf "./$file" "$HOME/$file"
done

vscode_keybindings="$HOME/Library/Application Support/Code/User/keybindings.json"
cp "./keybindings.json" "${vscode_keybindings}"
