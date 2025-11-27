#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2pro"}
cd "$GAME_PATH"
./q2proded +set homedir ./ \
    +set dedicated 1 \
    +set game jump \
    +exec server.cfg

#    +set port 27910 \
#    +set net_port 27910 \

