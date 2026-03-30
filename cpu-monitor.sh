#!/bin/bash

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

check_cpu() {
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | tr -d '%us,')
    log "Current CPU usage: ${CPU}%"
}

log "CPU check starting"
check_cpu
log "CPU check complete"
