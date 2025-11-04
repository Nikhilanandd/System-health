#!/bin/bash

# ==========================================
# System Health Monitoring Script
# Author: Nikhil Anand
# Date: 4/11/25
# ==========================================

# Colors for output
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

echo -e "${BLUE}========== SYSTEM HEALTH REPORT ==========${RESET}"
echo "Date & Time: $(date)"
echo "Hostname: $(hostname)"
echo "------------------------------------------"

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo -e "${YELLOW}CPU Usage:${RESET} $CPU_USAGE"

# Memory Usage
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
echo -e "${YELLOW}Memory Usage:${RESET} $MEM_USAGE"

# Disk Usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
echo -e "${YELLOW}Disk Usage (root):${RESET} $DISK_USAGE"

# Uptime
UPTIME=$(uptime -p)
echo -e "${YELLOW}Uptime:${RESET} $UPTIME"

# Logged-in users
USERS=$(who | wc -l)
echo -e "${YELLOW}Logged-in Users:${RESET} $USERS"

# Network Information
echo -e "${YELLOW}Network Info:${RESET}"
ip -brief address show | grep -v "lo"

echo -e "${BLUE}==========================================${RESET}"
