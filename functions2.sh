#!/bin/bash
log() {
echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

check_disk() {
    USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')
    if [ "$USAGE" -gt 80 ]; then
        log "ALERT: Disk at $USAGE%"
    else
        log "OK: Disk at $USAGE%"
    fi
}

check_memory() {
    FREE=$(free -m | awk 'NR==2{print $4}')
    log "Free memory: ${FREE}MB"
}

log "Starting system check"
check_disk
check_memory
log "System check complete"


