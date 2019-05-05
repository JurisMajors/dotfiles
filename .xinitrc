if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
mpd ~/.config/mpd/mpd.conf
exec i3
