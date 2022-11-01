#!/bin/bash

ip link set wlan0 down
doas netctl start wlan0-$1
