#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/quake"}
cd "$GAME_PATH"

export MANGOHUD=1
export MANGOHUD_CONFIG='gpu_name'
export DRI_PRIME=1

EXEC=""
[ -n "$(command -v gamemoderun 2>/dev/null)" ] && EXEC="$EXEC gamemoderun"
#[ -n "$(command -v gamescope 2>/dev/null)" ] && EXEC="$EXEC gamescope -W $WIDTH -H $HEIGHT -r $REFRESH -f --"
[ -n "$(command -v mangohud 2>/dev/null)" ] && EXEC="$EXEC mangohud"
$EXEC ./quakespasm \
    +exec quakespasm_autoexec.cfg $*

