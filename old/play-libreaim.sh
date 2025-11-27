#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/.local/src/LibreAim"}
cd "$GAME_PATH"
./LibreAim.x86_64

