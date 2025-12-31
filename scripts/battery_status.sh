#!/bin/bash

# Get battery status
battery=$(acpi -b)

# Check if acpi output is empty
#if [ -z "$battery" ]; then
#    echo "󰂃"
#    exit 1
#fi

# Check if acpi output is empty
if [ -z "$battery" ]; then
    exit 0   # silently exit so i3blocks does not display anything
fi


# Extract percentage and charging status
percent=$(echo "$battery" | grep -oP '\d+%' | tr -d '%')
status=$(echo "$battery" | awk '{print $3}' | tr -d ',')

# Define icons for different battery levels
if [ "$percent" -le 20 ]; then
    icon=" "  # Very low battery
elif [ "$percent" -le 30 ]; then
    icon=" "  # Low battery
elif [ "$percent" -le 60 ]; then
    icon=" "  # Medium battery
elif [ "$percent" -le 80 ]; then
icon=" " 

elif [ "$percent" -le 80 ]; then
icon=" "
 
elif [ "$percent" -le 97 ]; then
    icon=" "  # High battery
else
    icon=" "  # Fully charged
fi

# Show charging status with appropriate icon
if [ "$status" == "Charging" ]; then
    echo "$icon $percent% "  # Add charging symbol
else
    echo "$icon $percent%"  # Display battery status without charging symbol
fi



