#!/bin/bash

# SCREENSHOT SCRIPT
# DEPS: scrot, xclip, dunstify

scrot -i -s -o -F /tmp/scrot.png -z
xclip -selection clipboard -t image/png -i /tmp/scrot.png
dunstify -r 104 -a scrot -t 2500 "Screenshot saved" -I /tmp/scrot.png
