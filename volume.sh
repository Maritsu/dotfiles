#!/bin/bash

value=$1
device=$(pamixer --get-default-sink)
device=($device)
device=${device[@]:4}
device=${device:1:${#device}-2}

if [[ value -gt 0 ]]; then
	pamixer -i $value
elif [[ value -lt 0 ]]; then
	value=$(( -1*value ))
	pamixer -d $value
else
	pamixer -t
fi
newvol=$(pamixer --get-volume-human)

if [[ newvol != "muted" ]]; then
	dunstify -r 102 -a volstat -t 2500 "$device" -h int:value:$newvol
else
	dunstify -r 102 -a volstat -t 2500 "$device" "Muted"
fi
