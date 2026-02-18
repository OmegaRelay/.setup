### compinstall ###
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' verbose false
zstyle :compinstall filename '~/.zshrc'
fpath=(~/.docker/completions $fpath)

autoload -Uz compinit
compinit


###  Version Control ###
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes 'true'

zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%F{5}[%F{2}%b%F{white}%u%c%f%F{5}]%f '

zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'


### History ###
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e


### Aliases ###
alias ll="ls -lah --color=auto"
alias copy="xclip -sel clip"
alias ssh-keygen="ssh-keygen -t ed25519"
alias nv="nvim"
alias lgit="lazygit"
alias unzip-tar="tar -xvf"
alias unzip-gzip="tar -xzvf"
alias unzip-bzip="tar -xjvf"
alias ssh-config="$EDITOR $SSH_DIR/config"
alias google="w3m google.com"
alias vim="nvim"
alias spotify="ncspot"
alias venv="source .venv/bin/activate"

# MacOS Specific
if [[ "$OSTYPE" == "darwin"* ]]; then 
    alias lsusb="system_profiler SPUSBDataType"
    alias x64="env /usr/bin/arch -x86_64 /bin/zsh --login"

	# Renode
	RENODE_APP_PATH="/Applications/Renode.app" 
	if [[ -d "$RENODE_APP_PATH" ]]; then
		alias renode="mono $RENODE_APP_PATH/Contents/MacOS/bin/Renode.exe"
		alias renode-test="$RENODE_APP_PATH/Contents/MacOS/tests/renode-test"
	fi
fi

### Keybinds ###
# Open buffer for command editing
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

bindkey ' ' magic-space

### Change Dir Hook ###
# Python venv loader
chpwd_python() {
    if [ -d .venv ]; then
        source .venv/bin/activate
    elif [ -d venv ]; then
        source venv/bin/activate
    elif [ -n "$VIRTUAL_ENV" ]; then
        deactivate
    fi
}

chpwd_nvm() {
    if [ -f .nvmrc ]; then
        nvm use
    fi
}

chpwd() {
    chpwd_python
    chpwd_nvm
}

### Extra Files to Source ###
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


### Prompt setup ###
precmd () { vcs_info }
setopt PROMPT_SUBST

PROMPT_DIR='%F{cyan}%2d%f'
PROMPT_USER='%F{green}%n%f'
PROMPT_TIME='%F{red}%w %T%f'
PROMPT="$PROMPT_USER:$PROMPT_DIR ${vcs_info_msg_0_} 
$PROMPT_TIME %(!. §.->) "

del-prompt-accept-line() {
    PROMPT="$PROMPT_TIME %(!. §.->) "
    zle reset-prompt
    PROMPT="%(?. .
%F{red}  %?%f)
$PROMPT_USER:$PROMPT_DIR ${vcs_info_msg_0_} 
$PROMPT_TIME %(!. §.->) "
    zle accept-line
}

zle -N del-prompt-accept-line
bindkey "^M" del-prompt-accept-line
