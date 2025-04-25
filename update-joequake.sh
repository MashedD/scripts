#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/matthewearl/JoeQuake-1.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/joequake"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/quake"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
mkdir -p build
cd build
cmake ..
make
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/joequake-gl" ] || ln -s "$SOURCE_PATH/build/trunk/joequake-gl" "$DEST_PATH"

echo "[+] Done"

