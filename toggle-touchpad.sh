#!/usr/bin/env bash
set -Eeuo pipefail
TOUCHPAD_NAME="ELAN0300:00 04F3:3206 Touchpad"
STATE=$(xinput list-props "$TOUCHPAD_NAME" | grep "Device Enabled" | awk '{print $NF}')
if [ "$STATE" -eq 1 ]; then
    xinput disable "$TOUCHPAD_NAME"
    notify-send "Touchpad" "Off" -i input-touchpad
else
    xinput enable "$TOUCHPAD_NAME"
    notify-send "Touchpad" "On" -i input-touchpad
fi

