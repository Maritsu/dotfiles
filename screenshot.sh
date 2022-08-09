#!/bin/bash

# SCREENSHOT SCRIPT
# DEPS: scrot, xclip

scrot -i -s -o -F /tmp/scrot.png -z
xclip -selection clipboard -t image/png -i /tmp/scrot.png

# KEEPS FILE IN /tmp CUZ WHY NOT
# I CANT BE BOTHERED TO DELETE IT :trol:
# ALSO ACTUALLY USEFUL KINDA
