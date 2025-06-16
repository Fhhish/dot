#!/bin/bash

wifi_status=$(nmcli radio wifi)

if [ "$wifi_status" = "enabled" ]; then
    nmcli radio wifi off
    notify-send -t 1000 "Wifi off"
else
    nmcli radio wifi on
    notify-send -t 1000 "Wifi on"
fi
