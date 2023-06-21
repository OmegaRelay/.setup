#!/bin/bash

#get the cloned directory path
DIR=$(git rev-parse --show-toplevel)

printf "Creating symbolic links, from %s...\n" "$DIR"
ln -s "$DIR"/.zshrc		~/.zshrc
ln -s "$DIR"/.gitconfig	~/.gitconfig
ln -s "$DIR"/.vimrc		~/.vimrc
#check if file exists first
ln -s "$DIR"/vscode-settings.json ~/.config/Code/User/settings.json
