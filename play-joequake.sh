#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/quake"}
cd "$GAME_PATH"
./joequake-gl \
    -mem 512 \
    +set s_khz 44 \
    +exec joequake_autoexec.cfg \
    +playdemo demos/nh/all_5716.dz

