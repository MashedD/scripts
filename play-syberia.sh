#!/usr/bin/env bash
set -Eeuo pipefail

# Display resolution
ORIGINAL_RESOLUTION=$(xrandr --current | grep '*' | awk '{print $1}')
CONNECTED_DISPLAY=$(xrandr | grep ' connected' | awk '{print $1}' | head -n 1)
xrandr --output "$CONNECTED_DISPLAY" --mode 800x600

env LUTRIS_SKIP_INIT=1 lutris lutris:rungameid/32

# Restore display resolution
xrandr --output "$CONNECTED_DISPLAY" --mode "$ORIGINAL_RESOLUTION"

