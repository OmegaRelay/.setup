#!/bin/bash

#get the cloned directory path
DIR=$(git rev-parse --show-toplevel)

ORIG_FILES=(
	"$DIR"/.zshrc
	"$DIR"/.gitconfig
	"$DIR"/.vimrc
	"$DIR"/vscode-settings.json
)

END_FILES=(
	"$HOME"/.zshrc	
	"$HOME"/.gitconfig
	"$HOME"/.vimrc
	"$HOME"/.config/Code/User/settings.json
)

INDEX=0

cd "$DIR"

printf "Creating symbolic links, from %s...\n" "$DIR"
for FILE in ${END_FILES[@]}; do
	printf "%s\n" "$FILE"
	if [[ -f "$FILE" ]]; then
		rm "$FILE"
	fi
	ln -s ${ORIG_FILES[INDEX]}	"$FILE"
	((INDEX++))
done
printf "...Done\n"
