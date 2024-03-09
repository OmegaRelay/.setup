## Path additions
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/bin"

export XDG_CONFIG_HOME="$HOME/.config"

export SSH_DIR="$HOME/.ssh"

export CARGO_DIR="$HOME/.cargo"
[ -s "$CARGO_DIR/env" ] && . "$CARGO_DIR/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export EDITOR=nvim
