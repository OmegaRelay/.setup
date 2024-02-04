clear

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


### Prompt setup ###
precmd () { vcs_info }
setopt PROMPT_SUBST
DIR='%F{cyan}%2d%f'
PROMPT='
%F{green}%n%f:'$DIR' ${vcs_info_msg_0_} 
%F{red}%w %T%f %(!. §.->) '

# Add devinfo to start of each terminal
# checks neofetch exists and then runs neofetch
[[ -f $(which neofetch) ]] && neofetch --color_blocks off


### Environment Variables ###
export SSH_CONFIG=~/.ssh/config

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
