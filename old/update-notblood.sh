#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/clipmove/NotBlood.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/notblood"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/notblood"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
make
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/notblood" ] || ln -s "$SOURCE_PATH/notblood" "$DEST_PATH"
[ -e "$DEST_PATH/notblood.pk3" ] || ln -s "$SOURCE_PATH/notblood.pk3" "$DEST_PATH"

echo "[+] Done"

