#!/bin/bash

#get the cloned directory path
DIR=$(git rev-parse --show-toplevel)
DOTFILE_DIR="$DIR/dotfiles"
CONFIG_DIR="$DIR/config"

ORIG_FILES=(
	"$DOTFILE_DIR/.zshrc"
	"$DOTFILE_DIR/.gitconfig"
	"$DOTFILE_DIR/.vimrc"
	"$CONFIG_DIR/init.vim"
)

END_FILES=(
	"$HOME"/.zshrc	
	"$HOME"/.gitconfig
	"$HOME"/.vimrc
	"$HOME"/.config/nvim/init.vim
)

INDEX=0

printf "Creating symbolic links, from %s...\n" "$DIR"
for FILE in ${END_FILES[@]}; do
	printf "%s\n" "$FILE"
	if [[ -f "$FILE" ]] || [[ -L "$FILE" ]]; then
		rm "$FILE"
	fi

	ln -s ${ORIG_FILES[INDEX]}	"$FILE"
	((INDEX++))
done
printf "...Done\n"
