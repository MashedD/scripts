#!/usr/bin/env bash
set -Eeuo pipefail
export GAME_PATH=${GAME_PATH:-"$HOME/Games/q2repro/single"}
#WIDTH=800 HEIGHT=600 \
play-q2repro.sh \
    +exec mashedd-q2repro-single.cfg \
    $*

