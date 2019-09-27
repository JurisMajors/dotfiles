#!/bin/sh
output=$(xrandr | grep 'DP-2 connected') 

if [[ $output ]]; then
    xrandr --output DVI-D-0 --mode 1920x1080 --pos 3840x0 --rotate left --rate 144 --output HDMI-0 --off --output HDMI-1 --off --output DP-0 --off --output DP-1 --off --output DP-2 --primary --mode 3840x2160 --pos 0x0 --rotate normal --rate 60 --output DP-3 --off
fi
