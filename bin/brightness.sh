#!/bin/bash
current=$(xrandr --current --verbose | grep "Brightness" | awk '{ print $2 }')
change=$2
if [ $1 == 1 ] # increase
then
    next=$(echo $current $change | awk '{print $1 + $2}')
else # decrease
    next=$(echo $current $change | awk '{print $1 - $2}')
fi
exec xrandr --output eDP-1 --brightness $next
