#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/fabiangreffrath/crispy-doom.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/crispy-doom"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/lastermaul"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
autoreconf -fiv
./configure
make
mkdir -p "$DEST_PATH"
[ -e "$DEST_PATH/crispy-hexen" ] || ln -s "$SOURCE_PATH/src/crispy-hexen" "$DEST_PATH"
[ -e "$DEST_PATH/crispy-setup" ] || ln -s "$SOURCE_PATH/src/crispy-setup" "$DEST_PATH"

echo "[+] Done"

