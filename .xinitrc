#!/bin/sh

# cd into home dir to make sure all terminals start in ~
cd $HOME

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
xmodmap "$usermodmap"
fi

# Add all other monitors (autorandr -s <name>: new configs)
autorandr -c
# Composite manager (shadows, rounded corners, fades, etc.): ricing stuff
picom -r 10 -o 0.5 --corner-radius 5 -D 1 -f -I 0.015 -O 0.015 -b &
# Set X keymap to match language :) polska gurom
# Change accordingly pls
setxkbmap pl &
# DWM status bar
slstatus &
# Notification daemon
dunst & 

# if dwm exits 0, restart -- this allows hot reloading of config.h
# instead quit using `pkill dwm` or MODKEY-Ctrl-Q
# shamelessly stolen from https://www.reddit.com/r/suckless/comments/fqmtoy/comment/flr8xm8/?utm_source=share&utm_medium=web2x&context=3
while type dwm >/dev/null ; do dwm && continue || break ; done
