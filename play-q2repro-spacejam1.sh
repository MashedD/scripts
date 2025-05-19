#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2repro/single"}
cd "$GAME_PATH"
./q2pro +set homedir ./ \
    +exec mashedd-q2repro.cfg \
    +exec mashedd-q2repro-single.cfg \
    +set game spacejam1 +load quick $*

