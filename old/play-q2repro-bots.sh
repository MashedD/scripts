#!/usr/bin/env bash
cd $(dirname "$0")
#WIDTH=800 HEIGHT=600 \
./play-q2repro.sh \
    +set game 3zb2 \
    +deathmatch 1 \
    +set cheats 1 \
    +set fraglimit 30 \
    +set timelimit 10 \
    +exec game.cfg \
    +set autospawn 4 \
    +map q2dm1


