#!/bin/sh

value=$1
brightnessctl s $value
max=$(brightnessctl m)
newcur=$(brightnessctl g)
# let perc=((newcur / max))
dunstify -r 103 -a brightstat -t 2500 "Screen brightness" -h int:value:$((100 * newcur / max))
