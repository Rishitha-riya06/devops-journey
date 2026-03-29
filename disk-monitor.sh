#!/bin/bash
THRESHOLD=80
USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Current disk usage: $USAGE%"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is above $THRESHOLD%"
    echo "Action required — clean up disk space"
else
    echo "OK: Disk usage is normal"
fi
