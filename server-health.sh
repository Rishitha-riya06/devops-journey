#!/bin/bash

log() {
echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

ALERTS=0

check_disk() {
THRESHOLD=80

USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')

log "current disk usgae in  %: $USAGE"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
   log " ALERT: disk usage is above $THRESHOLD"
   ALERTS=$((ALERTS+1))
   log " action required! "

else 
    log "disk usage level is ok"
fi
}


check_freememory() {
     FREE=$(free -m | awk 'NR==2{print $4}' | tr -d '%')
     if [ "$FREE" -lt 500 ]; then
        log "ALERT:free space is less than 500mb ."
        ALERTS=$((ALERTS+1))
        log " action required"

     else
        log " ${FREE}MB is available"
     fi
}


check_flask() {
    if ps aux  | grep -v grep | grep -i flask > /dev/null; then
       log "flask: RUNNING"
    else
       log "flask: NOT RUNNING"
       ALERTS=$((ALERTS+1))
    fi
}


log "starting server health check"
check_disk
check_freememory
check_flask
log "server health check complete"
log "total alerts triggered: $ALERTS"
