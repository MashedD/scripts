#!/usr/bin/env bash
set -Eeuo pipefail
REPO_URL="https://github.com/lavenderdotpet/LibreQuake"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/librequake"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/librequake"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
python3 build.py
mkdir -p "$DEST_PATH"
cp -rf "$SOURCE_PATH/releases/full/id1" "$DEST_PATH"

echo "[+] Done"

