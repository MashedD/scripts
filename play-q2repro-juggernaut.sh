#!/usr/bin/env bash
cd $(dirname "$0")
./play-q2repro-single.sh \
    +exec mashedd-common.cfg \
    +exec mashedd-player.cfg \
    +exec mashedd-q2repro.cfg \
    +exec mashedd-q2repro-single.cfg \
    +set game jugfull +load quick $*

