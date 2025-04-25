#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/quake"}
cd "$GAME_PATH"
./vkquake \
    +exec vkquake_autoexec.cfg \
    -game playq \
    +bind MOUSE3 "impulse 9"

