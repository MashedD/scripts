#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/DDaynormandyFPS"}
WIDTH=${WIDTH:-1920}
HEIGHT=${HEIGHT:-1080}
REFRESH=${REFRESH:-144}
cd "$GAME_PATH"
gamemoderun \
    gamescope -W $WIDTH -H $HEIGHT -r $REFRESH --force-grab-cursor -f -- \
        ./ddaynormandy

