#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/skullernet/q2pro"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/q2pro"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/q2pro"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
git submodule update --init --recursive
meson setup builddir --reconfigure
meson compile -C builddir
mkdir -p "$DEST_PATH/baseq2"
[ -e "$DEST_PATH/q2pro" ] || ln -s "$SOURCE_PATH/builddir/q2pro" "$DEST_PATH"
[ -e "$DEST_PATH/q2proded" ] || ln -s "$SOURCE_PATH/builddir/q2proded" "$DEST_PATH"
[ -e "$DEST_PATH/baseq2/gamex86_64.so" ] || ln -s "$SOURCE_PATH/builddir/gamex86_64.so" "$DEST_PATH/baseq2"

echo "[+] Done"

