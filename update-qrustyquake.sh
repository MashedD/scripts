#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/cyanbun96/qrustyquake.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/qrustyquake"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/quake"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
make -C "src"
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/qrustyquake" ] || ln -s "$SOURCE_PATH/src/qrustyquake" "$DEST_PATH"

echo "[+] Done"

