#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2repro-multi.sh \
    +exec mashedd-common.cfg \
    +exec mashedd-player.cfg \
    +exec mashedd-q2repro.cfg \
    +exec mashedd-q2repro-multi.cfg \
    +set game bots \
    +deathmatch 1 \
    +set cheats 1 \
    +set fraglimit 10 \
    +exec game.cfg \
    +set autospawn 4

