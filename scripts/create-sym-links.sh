#!/bin/bash

#get the cloned directory path
DIR=$(git rev-parse --show-toplevel)
DOTFILE_DIR="$DIR/dotfiles"
CONFIG_DIR="$DIR/config"

ORIG_FILES=(
	"$DOTFILE_DIR/.zshrc"
	"$DOTFILE_DIR/.gitconfig"
	"$DOTFILE_DIR/.vimrc"
	"$CONFIG_DIR/vscode-settings.json"
	"$CONFIG_DIR/nvchad.custom"
	"$CONFIG_DIR/tmux.conf"
	"$CONFIG_DIR/alacritty.toml"
)

END_FILES=(
	"$HOME/.zshrc"
	"$HOME/.gitconfig"
	"$HOME/.vimrc"
	"$HOME/.config/Code/User/settings.json"
	"$HOME/.config/nvim/lua/custom"
	"$HOME/.config/tmux/tmux.conf"
	"$HOME/.config/alacritty/alacritty.toml"
)

INDEX=0

printf "Creating symbolic links, from %s...\n" "$DIR"
for FILE in ${END_FILES[@]}; do
	printf "%s\n" "$FILE"
    
    # Remove directories for symlinks
	if [[ -d ${ORIG_FILES[INDEX]} ]]; then
		if [[ -d "$FILE" ]]; then
			rm -rf "$FILE"
		fi
	fi

	ln -sf ${ORIG_FILES[INDEX]}	"$FILE"
	((INDEX++))
done
printf "...Done\n"
