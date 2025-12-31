#!/bin/bash

# Get volume and mute status from PulseAudio
sink=@DEFAULT_SINK@
volume=$(pactl get-sink-volume $sink | awk '{print $5}' | head -1 | tr -d '%')
mute=$(pactl get-sink-mute $sink | awk '{print $2}')

# Choose icon based on volume level
if [ "$mute" = "yes" ]; then
    icon="󰝟"  # Muted
elif [ "$volume" -eq 0 ]; then
    icon=""   # Zero volume
elif [ "$volume" -le 30 ]; then
    icon=""   # Low volume
elif [ "$volume" -le 70 ]; then
    icon=" "   # Medium volume
else
    icon=" "   # High volume (can change to  or )
fi

echo "$icon $volume%"

