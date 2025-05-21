#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/quake"}
WIDTH=${WIDTH:-1920}
HEIGHT=${HEIGHT:-1080}
REFRESH=${REFRESH:-144}
cd "$GAME_PATH"
gamemoderun gamescope -W $WIDTH -H $HEIGHT -r $REFRESH --force-grab-cursor -f -- \
    ./vkquake \
        +exec vkquake_autoexec.cfg \
        -game playq \
        +bind MOUSE3 "impulse 9"

