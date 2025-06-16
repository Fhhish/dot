#!/bin/bash

brightness=$(brightnessctl g)
max_brightness=$(brightnessctl m)

brightness=$((brightness))
max_brightness=$((max_brightness))
brightness_percentage=$(( brightness * 100 / max_brightness ))

if [ $brightness_percentage -gt 50 ]; then
	echo $brightness_percentage 
fi


