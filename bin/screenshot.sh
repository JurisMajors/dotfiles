#!/bin/bash
if [ -x "$(command -v flameshot)" ]; then
    flameshot gui
else
    maim --highlight --color=0.3,0.4,0.6,0.4 -s --format png /dev/stdout | xclip -selection clipboard -t image/png -i
    notify-send -u "low" -t 1000 "Copied screenshot on clipboard!"
fi
