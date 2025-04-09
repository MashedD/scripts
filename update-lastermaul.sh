#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/GeorgePieVG/Lastermaul.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/lastermaul"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/lastermaul"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
make
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/lastermaul.wad" ] || ln -s "$SOURCE_PATH/wads/lastermaul.wad" "$DEST_PATH/lastermaul.wad"

echo "[+] Done"

