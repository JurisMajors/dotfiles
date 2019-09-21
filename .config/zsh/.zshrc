# load environment variables
[ -f "$HOME/.envrc" ] && source ~/.envrc

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="eastwood"
autoload -U colors && colors

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Edit line in vim with ctrl-z:
autoload edit-command-line; zle -N edit-command-line
bindkey '^z' edit-command-line


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^f' 'lfcd\n'
ENABLE_CORRECTION="true"

plugins=(
    zsh-syntax-highlighting 
    docker 
    golang 
    docker-compose 
    fzf 
    git 
    gpg-agent 
    pip 
    sudo 
    colored-man-pages
)

source $ZSH/oh-my-zsh.sh
[ -f "$HOME/.lficons" ] && source ~/.lficons
[ -f "$HOME/.lficons" ] && source ~/.lficons
[ -f "$HOME/.aliases" ] && source ~/.aliases
