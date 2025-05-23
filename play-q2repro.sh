#!/usr/bin/env bash
set -Eeuo pipefail
GAME_PATH=${GAME_PATH:-"$HOME/Games/q2repro"}
WIDTH=${WIDTH:-1920}
HEIGHT=${HEIGHT:-1080}
REFRESH=${REFRESH:-144}
cd "$GAME_PATH"

# Disable touchpad
TOUCHPAD_NAME="ELAN0300:00 04F3:3206 Touchpad"
xinput disable "$TOUCHPAD_NAME"

# Start game
#mangohud \
    gamemoderun gamescope -W $WIDTH -H $HEIGHT -r $REFRESH --force-grab-cursor -f -- \
        ./q2pro +set homedir . $*

# Restore touchpad? nah, don't care...

