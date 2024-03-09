## Path additions
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/bin"

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim

# If cargo is installed, source it's environment
[[ -f $(which cargo) ]] && . "$HOME/.cargo/env"
