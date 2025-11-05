#!/bin/bash

# ==========================================
# System Health Monitoring Script v2.0
# Author: Nikhil Anand
# ==========================================

LOG_FILE="$(pwd)/sys_health.log"

CPU_THRESHOLD=80
MEM_THRESHOLD=85
DISK_THRESHOLD=90

timestamp=$(date +"%Y-%m-%d %H:%M:%S")

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM_USAGE=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "[$timestamp] CPU: ${CPU_USAGE}% | MEM: ${MEM_USAGE}% | DISK: ${DISK_USAGE}%" >> "$LOG_FILE"

# Alerts
if (( ${CPU_USAGE%.*} > CPU_THRESHOLD )); then
    echo "⚠️  High CPU Usage: ${CPU_USAGE}%"
fi

if (( ${MEM_USAGE%.*} > MEM_THRESHOLD )); then
    echo "⚠️  High Memory Usage: ${MEM_USAGE}%"
fi

if (( ${DISK_USAGE%.*} > DISK_THRESHOLD )); then
    echo "⚠️  Disk almost full: ${DISK_USAGE}%"
fi

echo "System health logged at $timestamp"

