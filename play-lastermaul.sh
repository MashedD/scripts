#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/lastermaul"}
cd "$GAME_PATH"
./crispy-hexen -iwad lastermaul.wad

