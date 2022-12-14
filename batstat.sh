#!/bin/sh

# Control variable
# Possible values: NONE, FULL, LOW, CRITICAL
last="NONE"

# Default values for LOW/CRITICAL status
low=10
critical=5

while true; do

  # If battery is plugged, do stuff
  battery="/sys/class/power_supply/BAT0"
  if [ -d $battery ]; then

    capacity=$(cat $battery/capacity)
    status=$(cat $battery/status)

    # If battery full and not already warned about that
    if [ "$last" != "FULL" ] && [ "$status" = "Full" ]; then
	  dunstify -u low -a batstat -r 101 "Battery full" "Current state: $capacity%"
      last="FULL"
    fi

    # If low and discharging
    if [ "$last" != "LOW" ] && [ "$status" = "Discharging" ] && [ $capacity -le $low ]; then
	  dunstify -a batstat -r 101 "Battery low" "Current state: $capacity%"
      last=LOW
    fi

    # If critical and discharging
    if [ "$status" = "Discharging" ] && [ $capacity -le $critical ]; then
	  dunstify -u critical -a batstat -r 101 "Battery critical" "Current state: $capacity%"
      last=CRITICAL
    fi
  fi
  sleep 60
done
