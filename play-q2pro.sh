#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2pro"}
cd "$GAME_PATH"
ORIGINAL_RESOLUTION=$(xrandr --current | grep '*' | awk '{print $1}')
CONNECTED_DISPLAY=$(xrandr | grep ' connected' | awk '{print $1}' | head -n 1)
xrandr --output "$CONNECTED_DISPLAY" --mode 640x480
ORIGINAL_DPI=$(ratbagctl G102 dpi get | sed 's/dpi//g')
ratbagctl G102 dpi set 3000
./q2pro +set homedir ./ \
    +exec mashedd-common.cfg \
    +exec mashedd-player.cfg \
    +exec mashedd-q2pro.cfg \
    $*
xrandr --output "$CONNECTED_DISPLAY" --mode "$ORIGINAL_RESOLUTION"
ratbagctl G102 dpi set ${ORIGINAL_DPI}

