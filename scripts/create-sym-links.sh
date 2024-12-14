#!/bin/bash

main() {
    # get the absolute path to the setup dir
    local DIR="$PWD"/$(dirname "$0")/../.
    local DOTFILE_DIR=$(strip_path "$DIR/dotfiles")
    local CONFIG_DIR=$(strip_path "$DIR/config")

    local vscode_user_dir="$HOME/.config/Code/User"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        local vscode_user_dir="$HOME/Library/Application Support/Code/User"
    fi

    local ORIG_FILES=(
        "$DOTFILE_DIR/.zshenv"
        "$DOTFILE_DIR/.zshrc"
        "$DOTFILE_DIR/.gitconfig"
        "$DOTFILE_DIR/.vimrc"
        "$CONFIG_DIR/vscode-settings.json"
        "$CONFIG_DIR/nvchad.custom"
        "$CONFIG_DIR/tmux.conf"
        "$CONFIG_DIR/alacritty.toml"
    )

    local END_FILES=(
        "$HOME/.zshenv"
        "$HOME/.zshrc"
        "$HOME/.gitconfig"
        "$HOME/.vimrc"
        "$vscode_user_dir/settings.json"
        "$HOME/.config/nvim/lua/custom"
        "$HOME/.config/tmux/tmux.conf"
        "$HOME/.config/alacritty/alacritty.toml"
    )

    local INDEX=0

    printf "Creating symbolic links, from %s...\n" "$DIR"
    for FILE in "${END_FILES[@]}"; do
        local orig_file="${ORIG_FILES[INDEX]}"
        printf "'%s' => '%s'\n" "$orig_file" "$FILE"
        
        # Remove directories for symlinks
        if [[ -d ${ORIG_FILES[INDEX]} ]]; then
            if [[ -d "$FILE" ]]; then
                rm -rf "$FILE"
            fi
        else 
            mkdir -p "$(dirname "$FILE")"
        fi

        ln -sf "$orig_file" "$FILE"
        ((INDEX++))
    done
    printf "...Done\n"
}

##
# Function to strip dots and double dots from a given path
strip_path() {
    local PATH=$(echo "$1" | sed -e 's|/\./|/|g' -e ':a' -e 's|/[^/]*/\.\./|/|' -e 't a')
    echo $PATH
}

main
