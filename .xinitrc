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

# Set X keymap to match language :) polska gurom
setxkbmap pl &
# Composite manager for them o p a c i t y
picom -r 5 -o 0.5 -l 0 -t 0 -D 0 -m 1.0 -b
# Notification daemon
dunst & 

# if dwm exits 0, restart -- this allows hot reloading of config.h
# instead quit using `pkill dwm` or MODKEY-Ctrl-Q
# shamelessly stolen from https://www.reddit.com/r/suckless/comments/fqmtoy/comment/flr8xm8/?utm_source=share&utm_medium=web2x&context=3
while type dwm >/dev/null; do
	(sleep 1 && ~/startshit.sh) &
	dwm && continue || break;
done
# while (( $? == 0 )); do
# 	dwm
# 	# dwm 2> ~/.dwm.log
# done
