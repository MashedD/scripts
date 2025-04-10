#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/openarena"}
cd "$GAME_PATH"
./openarena.x86_64

