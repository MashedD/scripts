#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games"}
cd "$GAME_PATH"

wine plutonium.exe

