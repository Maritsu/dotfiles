#!/bin/sh

playerctl $1
[[ "$1" == "stop" ]] && exit

sleep 0.1
title=$(playerctl metadata --format '{{artist}} - {{title}}')
text=$(playerctl metadata --format '{{status}}')
[[ $? -eq 1 ]] && exit
dunstify -a playerctl -r 105 -u normal "$title" "$text"
