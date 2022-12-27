#!/bin/sh

dir=$1
cvol=$(pamixer --get-volume)
margin=$((cvol % 5))
case "$dir" in
  "down") pamixer -d $margin;;
  "up")	  [[ $margin -ne 0 ]] && pamixer -i $((5 - $margin));;
  *) ;;
esac
