#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/Catoptromancy/blasphemer.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/blasphemer"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/blasphemer"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
make
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/blasphem.wad" ] || ln -s "$SOURCE_PATH/wads/blasphem.wad" "$DEST_PATH/blasphem.wad"
[ -e "$DEST_PATH/blasphdm.wad" ] || ln -s "$SOURCE_PATH/wads/blasphdm.wad" "$DEST_PATH/blasphdm.wad"

echo "[+] Done"

