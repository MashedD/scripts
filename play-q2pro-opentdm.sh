#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2pro.sh \
    +exec mashedd-common.cfg \
    +exec mashedd-player.cfg \
    +exec mashedd-q2pro.cfg \
    +exec mashedd-opentdm.cfg \
    +set game opentdm \
    +map q2dm1

