#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/quake"}
WIDTH=${WIDTH:-1920}
HEIGHT=${HEIGHT:-1080}
REFRESH=${REFRESH:-144}
cd "$GAME_PATH"

export MANGOHUD=1
export MANGOHUD_CONFIG='gpu_name'
export DRI_PRIME=1
export MESA_VK_DEVICE_SELECT="1002:743f"

EXEC=""
[ -n "$(command -v gamemoderun 2>/dev/null)" ] && EXEC="$EXEC gamemoderun"
[ -n "$(command -v gamescope 2>/dev/null)" ] && \
    EXEC="$EXEC gamescope -W $WIDTH -H $HEIGHT -r $REFRESH -f -S stretch --force-grab-cursor --"
#[ -n "$(command -v mangohud 2>/dev/null)" ] && EXEC="$EXEC mangohud"
$EXEC ./qrustyquake $*

