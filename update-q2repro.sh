#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/Paril/q2repro.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/q2repro"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/q2repro"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
git submodule update --init --recursive
meson setup builddir --reconfigure
meson compile -C builddir
[ -e "$DEST_PATH/q2repro" ] || ln -s "$SOURCE_PATH/builddir/q2repro" "$DEST_PATH"
[ -e "$DEST_PATH/q2reproded" ] || ln -s "$SOURCE_PATH/builddir/q2reproded" "$DEST_PATH"
[ -e "$DEST_PATH/baseq2/gamex86_64.so" ] || ln -s "$SOURCE_PATH/builddir/gamex86_64.so" "$DEST_PATH/baseq2"

echo "[+] Done"

