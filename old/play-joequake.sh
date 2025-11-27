#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/quake-joe"}
WIDTH=${WIDTH:-1920}
HEIGHT=${HEIGHT:-1080}
REFRESH=${REFRESH:-144}
cd "$GAME_PATH"

export MANGOHUD=1
export MANGOHUD_CONFIG='gpu_name'
export DRI_PRIME=1

EXEC=""
[ -n "$(command -v gamemoderun 2>/dev/null)" ] && EXEC="$EXEC gamemoderun"
#[ -n "$(command -v gamescope 2>/dev/null)" ] && EXEC="$EXEC gamescope -W $WIDTH -H $HEIGHT -r $REFRESH -f --"
$EXEC ./joequake-gl \
    -mem 512 \
    +set s_khz 44 \
    +exec joequake_autoexec.cfg \
    +playdemo demos/nh/all_5716.dz $*

