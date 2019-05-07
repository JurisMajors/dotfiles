#!/bin/sh
output=$(xrandr | grep 'DVI-D-0 connected') 

if [[ $output ]]; then
    xrandr --output DVI-D-0 --mode 1920x1080 --rate 144 --primary
fi
echo $(feh --randomize --bg-fill ~/Wallpapers/)
