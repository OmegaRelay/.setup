## Path additions
export PATH="$HOME/.local/bin:$PATH:"
export PATH="/opt/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

export SSH_DIR="$HOME/.ssh"

export CARGO_DIR="$HOME/.cargo"
[ -s "$CARGO_DIR/env" ] && source "$CARGO_DIR/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

export GO_DIR="$HOME/go"
export PATH="$PATH:$GO_DIR/bin"

export ANDROID_SDK_ROOT="$HOME/.local/android/sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/platforms"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"

export PATH="$(python3 -m site --user-base)/bin:$PATH"

export PATH="$HOME/.gem/bin:$PATH"
export PATH="usr/local/go/bin:$PATH"

export EDITOR=vim
