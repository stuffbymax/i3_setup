#!/bin/bash

BRIGHTNESS=$(brightnessctl g)
MAX_BRIGHTNESS=$(brightnessctl m)

BRIGHTNESS_PERCENT=$((BRIGHTNESS * 100 / MAX_BRIGHTNESS))

if [ "$BRIGHTNESS_PERCENT" -le 20 ]; then
    ICON="󰃟"
elif [ "$BRIGHTNESS_PERCENT" -le 60 ]; then
    ICON="󰃞"
else
    ICON="󰃠"
fi

echo "$ICON $BRIGHTNESS_PERCENT%"
