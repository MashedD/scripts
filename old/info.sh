#!/usr/bin/env bash
set -Eeuo pipefail

# Color codes
COLOR_RESET="\033[0m"
COLOR_HEADER="\033[1;36m"

date
acpi

BTCUSDT=$(curl -s https://api.binance.com/api/v3/ticker/price\?symbol=BTCUSDT | jq -r .price)
ETHUSDT=$(curl -s https://api.binance.com/api/v3/ticker/price\?symbol=ETHUSDT | jq -r .price)
echo -e "${COLOR_HEADER}BTC/USDT${COLOR_RESET}   ${BTCUSDT:0:-9}"
echo -e "${COLOR_HEADER}ETH/USDT${COLOR_RESET}   ${ETHUSDT:0:-9}"

WEATHER=$(curl -s wttr.in/Bydgoszcz\?format=1)
echo -e "${COLOR_HEADER}Bydgoszcz ${COLOR_RESET} ${WEATHER}"

echo -e "${COLOR_HEADER}Do zrobienia${COLOR_RESET}"
head -n5 ~/Documents/todo.txt

~/Projects/scripts/cal.sh

