#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/qrusty"}
cd "$GAME_PATH"
./qrustyquake -fullscreen_desktop

