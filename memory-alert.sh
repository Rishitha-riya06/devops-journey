#!/bin/bash

THRESHOLD=500

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

check_memory() {
    FREE=$(free -m | awk 'NR==2{print $4}')
    if [ "$FREE" -lt "$THRESHOLD" ]; then
        log "ALERT: Low memory — only ${FREE}MB free"
    else
        log "OK: Memory fine — ${FREE}MB free"
    fi
}

log "Memory check starting"
check_memory
log "Memory check complete"
