#!/usr/bin/env bash
set -Eeuo pipefail
CALENDAR="calendar.txt"

cd ~/Documents

# Get all unique tags
TAGS=$(grep -o ':[a-zA-Z0-9_]\+:' "$CALENDAR" | sed 's/://g' | sort | uniq)

# Iterate through each tag
echo -e "\nEvents grouped by tags:"
for TAG in $TAGS; do
    echo -e "\n\033[1;36mTag: :${TAG}:\033[0m"

    # Find and display entries containing this tag
    grep ":${TAG}:" "$CALENDAR" | while read -r line; do
        # Extract full date part
        date_part=$(echo "$line" | grep -oE '^[0-9]{4}-[0-9]{2}-[0-9]{2}')

        # Extract year, month and day
        year=$(echo "$date_part" | cut -d'-' -f1)
        month=$(echo "$date_part" | cut -d'-' -f2)
        day=$(echo "$date_part" | cut -d'-' -f3 | sed 's/^0//') # Remove leading zero

        # Get month name
        month_name=$(date -d "$year-$month-01" +"%B")

        # Get event description
        event=$(echo "$line" | sed "s/^$date_part //")

        # Highlight the current tag while preserving other tags' colors
        event_colored=$(echo "$event" | sed -E "s/:${TAG}:/$(printf '\033[1;32m'):${TAG}:$(printf '\033[0m')/g")

        # Display the formatted entry with full date info
        printf "%d-%02s-%02d: %s\n" "$year" "$month" "$day" "$event_colored"
    done
done
 
