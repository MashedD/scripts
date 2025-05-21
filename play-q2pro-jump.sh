#!/usr/bin/env bash
cd $(dirname "$0")
#WIDTH=800 HEIGHT=600 \
./play-q2pro.sh \
    +set game jump \
    +connect localhost:27910 \
    +map edge_easy

