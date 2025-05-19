#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2pro.sh \
    +set game jump \
    +connect localhost:27910 \
    +map edge_easy

