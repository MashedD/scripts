#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/vkquake"}
cd "$GAME_PATH"
./vkquake

