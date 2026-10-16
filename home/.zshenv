
[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"
export SSH_DIR="$HOME/.ssh"
export CARGO_DIR="$HOME/.cargo"
export NVM_DIR="$HOME/.nvm"
export GO_DIR="$HOME/go"
export ANDROID_SDK_ROOT="$HOME/.local/android/sdk"

export EDITOR="$(which nvim)"
export FZF_DEFAULT_COMMAND="rg"

## Sources
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
[ -e "$CARGO_DIR/env" ] && source "$CARGO_DIR/env"
[ -e "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -e "$HOME/.zshenv.local" ] && . "$HOME/.zshenv.local"

## Path modifications
# Prepend
export PATH="$(python3 -m site --user-base)/bin:$PATH"
export PATH="/opt/bin:$PATH"
export PATH="/opt/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Append
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
export PATH="$PATH:$GO_DIR/bin"
export PATH="$PATH:$HOME/.gem/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/platforms"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
