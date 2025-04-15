#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2pro.sh \
    +set game bots \
    +set cheats 1 \
    +set fraglimit 10 \
    +exec game.cfg \
    +set autospawn 4

