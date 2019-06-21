#!/bin/sh

case "$1" in
    *.tar*) tar tf "$1";;
    *.zip) unzip - -l "$1";;
    *.pdf) pdftotext "$1" -;;
    *.mp3 | *.flac | *.ogg | *.mkv | *.mp4 | *.flv | *.mpg | *.mov | *.avi) mediainfo "$1" ;; 
    *) highlight -O ansi "$1" || cat "$1";;
esac
