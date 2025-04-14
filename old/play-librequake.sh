#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/librequake"}
cd "$GAME_PATH"
./ironwail

