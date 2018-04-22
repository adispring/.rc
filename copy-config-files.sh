#!/bin/bash

dotfiles=(".zshrc" ".bashrc")
for file in ${dotfiles[@]}
do
    cp -rf "$HOME/$file" "./$file"
done

# 1、变量的读取是以“$”开始（如：变量定义：var=1，变量读取：echo $var）
# 2、变量名必须是由字母数字或下划线组成，且以字母或下横线开头
# 3、变量名一般为大写 
# 4、变量的定义：变量名=‘值’（等号左右没有空格）
vscode_keybindings="$HOME/Library/Application Support/Code/User/keybindings.json"
cp "${vscode_keybindings}" "./keybindings.json"
