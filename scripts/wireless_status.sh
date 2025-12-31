#!/bin/bash
ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
signal=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d: -f2)

if [[ -z "$ssid" || -z "$signal" ]]; then
    echo "睊 Disconnected"
else
    echo "  $ssid ($signal%)"
fi
