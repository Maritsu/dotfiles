#!/bin/sh

playerctl $1
[[ "$1" == "stop" ]] && exit
title=$(playerctl metadata --format '{{artist}} - {{title}}')
text=$(playerctl metadata --format '{{status}}')
dunstify -a playerctl -r 105 -u normal "$title" "$text"
