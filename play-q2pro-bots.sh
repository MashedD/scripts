#!/usr/bin/env bash
cd $(dirname "$0")
#WIDTH=800 HEIGHT=600 \
./play-q2pro.sh \
    +set game 3zb2 \
    +set cheats 1 \
    +set fraglimit 30 \
    +set timelimit 10 \
    +exec game.cfg \
    +set autospawn 4

