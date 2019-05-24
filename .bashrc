PS2='> '
export PS1="\[\033[38;5;52m\][\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]\w\[$(tput sgr0)\]\[\033[38;5;52m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
set -o vi
stty -ixon
export EDITOR=nvim
export OPENER=xdg-open
export TERMINAL=termite
export PATH=$PATH:$HOME/bin/
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
# aliases
alias lf="lfcd"
alias sp="sudo pacman"
alias v="nvim"
alias ls='ls --color=auto'
alias tb="nc seashells.io 1337"
alias cb="xclip -selection clipboard"
bind -x $'"\C-l":clear;'

