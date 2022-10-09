#!/bin/bash

value=$1
brightnessctl s $value
max=$(brightnessctl m)
newcur=$(brightnessctl g)
dunstify -r 103 -a brightstat -t 2500 "Screen brightness" -h int:value:$(newcur/max)
