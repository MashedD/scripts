#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2pro.sh \
    +exec mashedd-common.cfg \
    +set game opentdm \
    +map q2dm1

