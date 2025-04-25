#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/quake"}
cd "$GAME_PATH"
./ironwail \
    +exec ironwail_autoexec.cfg \
    +exec ironwail_modern.cfg

