#!/bin/bash

#get the cloned directory path
DIR=$(git rev-parse --show-toplevel)

ORIG_FILES=(
	"$DIR"/.zshrc
	"$DIR"/.gitconfig
	"$DIR"/.vimrc
)

END_FILES=(
	"$HOME"/.zshrc	
	"$HOME"/.gitconfig
	"$HOME"/.vimrc
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
