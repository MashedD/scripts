#!/usr/bin/env bash
set -Eeuo pipefail
while true; do
    #xsetroot -name "$(LC_TIME=en_US.UTF-8 TZ='America/New_York' date '+%A, %d.%m.%Y, %H:%M:%S %Z') | $(LC_TIME=pl_PL.UTF-8 TZ='Europe/Warsaw' date '+%A, %d.%m.%Y, %H:%M:%S %Z')"
    xsetroot -name "$(LC_TIME=en_US.UTF-8 TZ='America/New_York' date '+%H:%M:%S %Z') | $(LC_TIME=pl_PL.UTF-8 TZ='Europe/Warsaw' date '+%A, %d.%m.%Y, %H:%M:%S %Z')"
    sleep 1
done

