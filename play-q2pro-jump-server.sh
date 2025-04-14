#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2pro"}
cd "$GAME_PATH"
#screen -d -m -S q2jumpserver
./q2proded +set homedir ./ \
    +exec mashedd-player.cfg \
    +set dedicated 1 \
    +set game jump \
    +set port 27910 \
    +set net_port 27910 \
    +exec server.cfg

