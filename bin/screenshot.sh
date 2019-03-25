#!/bin/bash
flameshot gui & sleep 30; kill $(ps aux | awk '/[f]lameshot/ {print $2}')
notify-send -u "low" -t 1000 "Copied screenshot on clipboard!"
