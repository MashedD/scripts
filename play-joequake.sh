#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/joequake"}
cd "$GAME_PATH"
./joequake-gl -mem 512 +set s_khz 44 +playdemo demos/nh/all_5716.dz

