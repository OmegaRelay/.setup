### compinstall ###
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' verbose false
zstyle :compinstall filename '~/.zshrc'

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

#
# TMUX as a singleton
alias tmux="(tmux list-sessions && tmux attach) || echo Starting Server && tmux"

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


### Extra Files to Source ###
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### Prompt setup ###
precmd () { vcs_info }
setopt PROMPT_SUBST
DIR='%F{cyan}%2d%f'
PROMPT='
%F{green}%n%f:'$DIR' ${vcs_info_msg_0_} 
%F{red}%w %T%f %(!. §.->) '
