#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/.wine/drive_c/Program Files (x86)/Family Games/SSV"}
cd "$GAME_PATH"

# Display resolution
ORIGINAL_RESOLUTION=$(xrandr --current | grep '*' | awk '{print $1}')
CONNECTED_DISPLAY=$(xrandr | grep ' connected' | awk '{print $1}' | head -n 1)
xrandr --output "$CONNECTED_DISPLAY" --mode 640x480

wine SSV.exe

# Restore display resolution
xrandr --output "$CONNECTED_DISPLAY" --mode "$ORIGINAL_RESOLUTION"

