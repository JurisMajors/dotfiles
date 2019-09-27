# load environment variables
[ -f "$HOME/.config/.envrc" ] && source ~/.config/.envrc

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="eastwood"
autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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
ENABLE_CORRECTION="true"

plugins=(
    zsh-syntax-highlighting 
    sudo
    docker 
    golang 
    docker-compose 
    fzf 
    git 
    gpg-agent 
    pip 
    colored-man-pages
#    vi-mode
)

source $ZSH/oh-my-zsh.sh

#bindkey -v
export FZF_BASE=/usr/share/fzf
bindkey -s '^f' 'lfcd\n'
export KEYTIMEOUT=1

[ -f "$HOME/.config/lf/.lficons" ] && source ~/.config/lf/.lficons
[ -f "$HOME/.config/.aliases" ] && source ~/.config/.aliases
