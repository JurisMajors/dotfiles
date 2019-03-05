#!/bin/sh
output=$(xrandr | grep 'HDMI-0 connected') 

if [[ $output ]]; then
    xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
else
    xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-0 --off
fi
echo $(feh --randomize --bg-fill ~/Wallpapers/*)
