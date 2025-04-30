#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/sezero/quakespasm.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/quakespasm"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/quake"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
make -C "Quake" USE_SDL2=1
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/quakespasm" ] || ln -s "$SOURCE_PATH/Quake/quakespasm" "$DEST_PATH"
[ -e "$DEST_PATH/quakespasm.pak" ] || ln -s "$SOURCE_PATH/Quake/quakespasm.pak" "$DEST_PATH"

echo "[+] Done"

