#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/doom/freedoom"}
cd "$GAME_PATH"
./crispy-doom -iwad freedoom1.wad

