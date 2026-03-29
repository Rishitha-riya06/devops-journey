#!/bin/bash
NAME="Rishitha"
COURSE="DevOps"
YEAR=2024

echo "student: $NAME"
echo "learning: $COURSE"
echo "year: $YEAR"

CURRENT_DIR=$(pwd)
CURRENT_USER=$(whoami)
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}')

echo "Currently in: $CURRENT_DIR"
echo "Logged in as: $CURRENT_USER"
echo "Root disk usage: $DISK_USAGE"
