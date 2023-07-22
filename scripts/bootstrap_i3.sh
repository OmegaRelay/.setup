#! /bin/bash
###############
# This script is intended to bootstrap a fresh 
# linux machine with i3 wm with all the customisation
################

main(){
    ln -sf "$HOME"/.dotfiles/i3/config "$HOME"/.config/i3/
    ln -sf "$HOME"/.dotfiles/i3/i3blocks.conf "$HOME"/.config/i3/

    mkdir -p "$HOME"/.config/rofi
    cd "$HOME"/.config/rofi
    if [[ -f "config.rasi" ]]; then
        rm config.rasi
    fi
    echo -e "@theme \"/usr/share/rofi/themes/lb.rasi\"" >> "$HOME"/.config/rofi/config.rasi
}

main
