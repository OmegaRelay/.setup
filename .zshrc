export PATH=$PATH:~/bin

autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes 'true'


zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '*'

zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%F{5}[%F{2}%b%F{white}%u%c%f%F{5}]%f '

zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

##
# Prompt setup
##
precmd () { vcs_info }
setopt PROMPT_SUBST
DIR='%F{cyan}%2d%f'
PROMPT='
%F{green}%n%f:'$DIR' ${vcs_info_msg_0_} 
%F{red}%w %T%f %(!. §.->) '
