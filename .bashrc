PS2='> '
export PS1="\[\033[38;5;52m\][\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]\w\[$(tput sgr0)\]\[\033[38;5;52m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
set -o vi
export EDITOR=nvim
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"
alias sp="sudo pacman"
alias r="ranger"
alias v="nvim"
alias ls='ls --color=auto'
bind -x $'"\C-l":clear;'
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
