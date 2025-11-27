#!/usr/bin/env bash
set -Eeuo pipefail

# Configuration
MONTH=${MONTH:-$(date +%m)}
YEAR=${YEAR:-$(date +%Y)}
CURRENT_DATE=$(date +%Y-%m-%d)
TODAY_DAY=$(date +%d | sed 's/^0//')
CALENDAR="calendar.txt"

# Color codes
COLOR_RESET="\033[0m"
COLOR_HEADER="\033[1;36m"
COLOR_PAST_EVENT="\033[38;5;240m"
COLOR_DATE="\033[1;33m"
COLOR_TODAY="\033[1;32m"
COLOR_EVENT_DAY="\033[1;31m"
declare -a TAG_COLORS=("31" "32" "33" "34" "35" "36")  # Red, Green, Yellow, Blue, Magenta, Cyan

# Get Polish month name
get_polish_month() {
    case $1 in
        01) echo "Styczeń";;
        02) echo "Luty";;
        03) echo "Marzec";;
        04) echo "Kwiecień";;
        05) echo "Maj";;
        06) echo "Czerwiec";;
        07) echo "Lipiec";;
        08) echo "Sierpień";;
        09) echo "Wrzesień";;
        10) echo "Październik";;
        11) echo "Listopad";; 
        12) echo "Grudzień";;
        *) echo "";;
    esac
}

# Generate calendar from scratch
generate_calendar() {
    local month=$1 year=$2
    local first_day=$(date -d "$year-$month-01" +%u) # 1-7 (Mon-Sun)
    local days_in_month=$(date -d "$year-$month-01 +1 month -1 day" +%d | sed 's/^0//')
    local month_name=$(get_polish_month "$month")

    # Header
    printf "\n${COLOR_HEADER}%s${COLOR_RESET}\n" "$month_name $year"
    #local header="$month_name $year"
    #local header_length=${#header}
    #local total_width=20
    #local left_padding=$(( (total_width - header_length) / 2 ))
    #printf "\n${COLOR_HEADER}%*s%s${COLOR_RESET}\n" $left_padding "" "$header"
    echo "po wt śr cz pi so ni"

    # Calculate padding for first day
    local padding=$(( (first_day - 1) * 3 ))
    printf "%${padding}s"

    # Print days
    for ((day=1; day<=days_in_month; day++)); do
        # Check events
        local has_event=0 is_past=0
        if grep -qE "^$year-$month-$(printf "%02d" $day)[ -]" "$CALENDAR"; then
            has_event=1
            if [[ "$year-$month-$(printf "%02d" $day)" < "$CURRENT_DATE" ]]; then
                is_past=1
            fi
        fi

        # Print day with appropriate color
        if [[ "$year" == "$(date +%Y)" && "$month" == "$(date +%m)" && "$day" == "$TODAY_DAY" ]]; then
            printf "${COLOR_TODAY}%2d${COLOR_RESET} " "$day"
        elif ((has_event)); then
            if ((is_past)); then
                printf "${COLOR_PAST_EVENT}%2d${COLOR_RESET} " "$day"
            else
                printf "${COLOR_EVENT_DAY}%2d${COLOR_RESET} " "$day"
            fi
        else
            printf "%2d " "$day"
        fi

        # New line after Sunday
        if (( (first_day + day - 1) % 7 == 0 )); then
            printf "\n"
        fi
    done
    printf "\n"
}

# Colorize tags function using pure Bash
colorize_tags() {
    local input=$1
    local color_index=0
    local output=""
    local remaining="$input"

    while [[ "$remaining" =~ (:([a-zA-Z0-9_]+):) ]]; do
        # Text before tag
        output+="${remaining%%${BASH_REMATCH[0]}*}"
        # Tag with color
        local color_code="${TAG_COLORS[color_index % ${#TAG_COLORS[@]}]}"
        output+="\033[1;${color_code}m${BASH_REMATCH[0]}\033[0m"
        # Move remaining text
        remaining="${remaining#*${BASH_REMATCH[0]}}"
        ((color_index++))
    done

    # Add remaining text after last tag
    output+="$remaining"

    echo -n "$output"
}

cd ~/Documents
#echo -e "\n${COLOR_HEADER}Dziś: $(date +%Y-%m-%d)${COLOR_RESET}"
generate_calendar "$MONTH" "$YEAR"

# Display events with colored tags
#echo -e "\n${COLOR_HEADER}Wydarzenia${COLOR_RESET}"
while IFS= read -r line; do
    date_part=$(echo "$line" | grep -oE '^[0-9]{4}-[0-9]{2}-([0-9]{2})')
    [[ -z "$date_part" ]] && continue

    if [[ "$date_part" =~ ^$YEAR-$MONTH- ]]; then
        day=$(echo "$date_part" | cut -d'-' -f3)
        event=$(echo "$line" | cut -d' ' -f2-)

        # Colorize tags
        event_colored=$(colorize_tags "$event")

        if [[ "$date_part" < "$CURRENT_DATE" ]]; then
            echo -e "${COLOR_PAST_EVENT}${day}: $event_colored${COLOR_RESET}"
        elif [[ "$date_part" == "$CURRENT_DATE" ]]; then
            echo -e "${COLOR_TODAY}${day}: $event_colored${COLOR_RESET}"
        else
            echo -e "${COLOR_DATE}${day}:${COLOR_RESET} $event_colored"
        fi
    fi
done < "$CALENDAR"

