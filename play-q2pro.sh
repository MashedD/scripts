#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2pro"}
cd "$GAME_PATH"

# Display resolution
#ORIGINAL_RESOLUTION=$(xrandr --current | grep '*' | awk '{print $1}')
#CONNECTED_DISPLAY=$(xrandr | grep ' connected' | awk '{print $1}' | head -n 1)
#xrandr --output "$CONNECTED_DISPLAY" --mode 640x480
# Mouse DPI
ORIGINAL_DPI=$(ratbagctl G102 dpi get | sed 's/dpi//g')
ratbagctl G102 dpi set 1000
# Disable touchpad
TOUCHPAD_NAME="ELAN0300:00 04F3:3206 Touchpad"
xinput disable "$TOUCHPAD_NAME"

# Start game
gamescope -W 1920 -H 1080 -r 144 --force-grab-cursor -f -- \
    ./q2pro +set homedir . $*

# Restore touchpad? nah, don't care...
# Restore mouse DPI
ratbagctl G102 dpi set ${ORIGINAL_DPI}
# Restore display resolution
#xrandr --output "$CONNECTED_DISPLAY" --mode "$ORIGINAL_RESOLUTION"

