#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/Novum/vkQuake.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/vkquake"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/quake"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
meson build
ninja -C build
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/vkquake" ] || ln -s "$SOURCE_PATH/build/vkquake" "$DEST_PATH"
[ -e "$DEST_PATH/vkquake.pak" ] || ln -s "$SOURCE_PATH/Quake/vkquake.pak" "$DEST_PATH"

echo "[+] Done"

