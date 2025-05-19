#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2pro.sh \
    +set game dday \
    +set deathmatch 1 \
    +exec autoexec \
    +map dday1

