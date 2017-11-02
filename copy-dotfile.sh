#!/bin/bash

dotfiles=(".zshrc" ".bashrc" ".spacemacs.d/")
for file in $dotfiles
do
    cp -rf "$HOME/$file" "./$file"
done
