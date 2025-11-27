#!/usr/bin/env bash
set -Eeuo pipefail
cd $(dirname "$0")
./update-ironwail.sh
./update-joequake.sh
./update-quakespasm.sh
./update-qrustyquake.sh
./update-vkquake.sh
#cd ~/.local/src/dwm; git pull; make
#cd ~/.local/src/st; git pull; make

