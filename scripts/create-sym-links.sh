#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

##
# Function to strip dots and double dots from a given path
strip_path() {
    local PATH=$(echo "$1" | sed -e 's|/\./|/|g' -e ':a' -e 's|/[^/]*/\.\./|/|' -e 't a')
    echo $PATH
}

main() {
    # get the absolute path to the setup dir
    local HOME_DIR=$(strip_path "$SCRIPT_DIR/../home")
    local CONFIG_DIR=$(strip_path "$SCRIPT_DIR/../config")

    printf "\nCreating symbolic links, from %s...\n" "$DOTFILE_DIR"
    for entry in "$HOME_DIR"/* "$HOME_DIR"/.[^.]*; do
        local target_path="$HOME"/"$(basename "$entry")"

        # Remove directories before symlinking or will create recursive links
        if [ -d "$entry" ] && [ -d "$target_path" ]; then
            rm -rf "$target_path"
        fi

        if [ -d "$entry" ] || [ -f "$entry" ]; then
            printf "%s => %s\n" "$target_path" "$entry"
            ln -sf "$entry" "$target_path"
        fi
    done

    printf "\nCreating symbolic links, from %s...\n" "$CONFIG_DIR"
    if [ -d "$XDG_CONFIG_HOME" ]; then
        for entry in "$CONFIG_DIR"/*; do
            local target_path="$XDG_CONFIG_HOME"/"$(basename "$entry")"

            # Remove directories before symlinking or will create recursive links
            if [ -d "$entry" ] && [ -d "$target_path" ]; then
                    rm -rf "$target_path"
            fi

            if [ -d "$entry" ] || [ -f "$entry" ]; then
                printf "%s => %s\n" "$target_path" "$entry"
                ln -sf "$entry" "$target_path"
            fi
        done
    else 
        printf "WARNING: 'XDG_CONFIG_HOME' not specified'"
    fi

    printf "...Done\n"
}

main $@
