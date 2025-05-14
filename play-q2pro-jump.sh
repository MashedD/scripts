#!/usr/bin/env bash
#cd $(dirname "$0")
#./play-q2pro.sh \
#    +exec mashedd-jump.cfg \
#    +set game jump \
#    +connect localhost:27910 \
#    +map edge_easy

GAME_PATH=${GAME_PATH:-"$HOME/Games/q2pro"}
cd "$GAME_PATH"
./q2pro +set homedir ./ \
    +exec mashedd-common.cfg \
    +set game jump \
    +connect localhost:27910 \
    +map edge_easy

