PS2='> '
export PS1="\[\033[38;5;52m\][\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]\w\[$(tput sgr0)\]\[\033[38;5;52m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
set -o vi
stty -ixon
export EDITOR=nvim
# export LANG="$LC_ALL"
export PATH=$PATH:$HOME/bin/
# ranger opening
function ranger-cd {
    # create a temp file and store the name
    tempfile="$(mktemp -t tmp.XXXXXX)"

    # run ranger and ask it to output the last path into the
    # temp file
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"

    # if the temp file exists read and the content of the temp
    # file was not equal to the current path
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        # change directory to the path in the temp file
        cd -- "$(cat "$tempfile")"
    fi

    # its not super necessary to have this line for deleting
    # the temp file since Linux should handle it on the next
    # boot
    rm -f -- "$tempfile"
}
# aliases
alias sp="sudo pacman"
alias r=ranger-cd
alias v="nvim"
alias ls='ls --color=auto'
alias tb="nc seashells.io 1337"
alias cb="xclip -selection clipboard"

bind -x $'"\C-l":clear;'
