#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2pro.sh \
    +exec mashedd-jump.cfg \
    +set game jump \
    +connect localhost:27910 \
    +map q2dm1

