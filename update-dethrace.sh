#!/usr/bin/env bash
set -Eeuo pipefail
echo "[*] $(basename "$0")"
REPO_URL="https://github.com/dethrace-labs/dethrace.git"
SOURCE_PATH=${SOURCE_PATH:-"$HOME/Games/.src/dethrace"}
DEST_PATH=${DEST_PATH:-"$HOME/Games/dethrace"}

[ -e "$SOURCE_PATH" ] || git clone "$REPO_URL" "$SOURCE_PATH"
cd "$SOURCE_PATH"
git pull
git submodule update --init --recursive
mkdir -p build
cd build
cmake ..
make
mkdir -p "$DEST_PATH/carmageddon-max-pack/CARMA"
mkdir -p "$DEST_PATH/carmageddon-max-pack/CARSPLAT"
[ -e "$DEST_PATH/carmageddon-max-pack/CARMA/dethrace" ] || ln -s "$SOURCE_PATH/build/dethrace" "$DEST_PATH/carmageddon-max-pack/CARMA"
[ -e "$DEST_PATH/carmageddon-max-pack/CARSPLAT/dethrace" ] || ln -s "$SOURCE_PATH/build/dethrace" "$DEST_PATH/carmageddon-max-pack/CARSPLAT"

echo "[+] Done"

