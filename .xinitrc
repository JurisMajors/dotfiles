if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
mpd ~/.config/mpd/mpd.conf
xrandr --dpi 140
~/bin/layout.sh
~/bin/wallpapershow &
exec i3
