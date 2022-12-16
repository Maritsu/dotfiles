#!/bin/sh

# polybar-msg cmd quit
killall polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
	if [[ $m != 'eDP-1' ]]; then
		MONITOR=$m polybar --config=~/.config/polybar/config.ini secondary &
	else
		polybar --config=~/.config/polybar/config.ini mainbar &
	fi
done

