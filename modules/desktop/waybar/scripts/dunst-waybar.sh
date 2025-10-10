#!/usr/bin/env bash

# Get notification count
COUNT=$(dunstctl count waiting)
HISTORY_COUNT=$(dunstctl count history)

# Check if dunst is paused
if dunstctl is-paused | grep -q "true"; then
    ICON="notification"
    TEXT="DND"
else
    if [ "$COUNT" -gt 0 ]; then
        ICON="notification"
        TEXT="$COUNT"
    else
        ICON="none"
        TEXT=""
    fi
fi

# Output in JSON format
echo "{\"text\":\"$TEXT\",\"icon\":\"$ICON\",\"tooltip\":\"$COUNT waiting, $HISTORY_COUNT in history\"}"
