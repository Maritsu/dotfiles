#!/bin/bash

value=$1
device=$(pamixer --get-default-sink)
device=($device)
device=${device[@]:4}
device=${device:1:${#device}-2}

if [[ ! value -eq 0 ]]; then
	pamixer -i $value
else
	pamixer -t
fi
newvol=$(pamixer --get-volume-human)

if [[ newvol != "muted" ]]; then
	dunstify -r 102 -a volstat -t 2500 "$device" "Volume: $newvol"
else
	dunstify -r 102 -a volstat -t 2500 "$device" "Muted"
fi
