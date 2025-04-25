#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/andrei-drexler/ironwail.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/ironwail"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/quake"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
make -C "Quake"
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/ironwail" ] || ln -s "$SOURCE_PATH/Quake/ironwail" "$DEST_PATH"
[ -e "$DEST_PATH/ironwail.pak" ] || ln -s "$SOURCE_PATH/Quake/ironwail.pak" "$DEST_PATH"

echo "[+] Done"

