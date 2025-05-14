#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2repro"}
cd "$GAME_PATH"
#ORIGINAL_RESOLUTION=$(xrandr --current | grep '*' | awk '{print $1}')
#CONNECTED_DISPLAY=$(xrandr | grep ' connected' | awk '{print $1}' | head -n 1)
#xrandr --output "$CONNECTED_DISPLAY" --mode 640x480
./q2pro +set homedir ./ \
    +exec mashedd-common.cfg \
    +exec mashedd-q2repro.cfg \
    +set game bots \
    +set cheats 1 \
    +set fraglimit 10 \
    +exec game.cfg \
    +set autospawn 1 \
    $*
#xrandr --output "$CONNECTED_DISPLAY" --mode "$ORIGINAL_RESOLUTION"

