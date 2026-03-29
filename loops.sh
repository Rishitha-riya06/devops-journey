#!/bin/bash
echo "Checking these directories:"
for DIR in /etc /var /home /tmp; do
    SIZE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
    echo "$DIR — Size: $SIZE"
done

echo "---"

COUNT=1
while [ $COUNT -le 5 ]; do
    echo "Attempt $COUNT of 5"
    COUNT=$((COUNT + 1))
done

echo "Done"
