#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2repro"}
WIDTH=${WIDTH:-800}
HEIGHT=${HEIGHT:-600}
REFRESH=${REFRESH:-144}
cd "$GAME_PATH"

# Disable touchpad
TOUCHPAD_NAME="ELAN0300:00 04F3:3206 Touchpad"
xinput disable "$TOUCHPAD_NAME"

export MANGOHUD=1
export MANGOHUD_CONFIG='gpu_name'
export DRI_PRIME=1

# Start game
EXEC=""
[ -n "$(command -v gamemoderun 2>/dev/null)" ] && EXEC="$EXEC gamemoderun"
#[ -n "$(command -v gamescope 2>/dev/null)" ] && \
#    EXEC="$EXEC gamescope -W $WIDTH -H $HEIGHT -r $REFRESH --force-grab-cursor -f -S stretch --"
[ -n "$(command -v mangohud 2>/dev/null)" ] && EXEC="$EXEC mangohud"
$EXEC ./q2repro +set homedir . $*

# Restore touchpad? nah, don't care...

