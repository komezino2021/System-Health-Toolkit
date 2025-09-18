#!/bin/bash
echo "=== System Health Check ==="

# Uptime
uptime -p

# CPU load
echo "CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'

# Memory usage
echo "Memory Usage:"
free -h

# Disk usage
echo "Disk Usage:"
df -h | grep '^/dev/'