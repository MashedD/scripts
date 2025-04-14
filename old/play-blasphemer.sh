#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/blasphemer"}
cd "$GAME_PATH"
./crispy-heretic -iwad blasphem.wad -deh blasphem.hhe -hhever 1.3 -file BLSMPTXT.WAD
#gzdoom -iwad blasphem.wad -deh blasphem.hhe -hhever 1.3 -file BLSMPTXT.WAD BLAS4U.pk3 BLASPR4U.pk3
 
