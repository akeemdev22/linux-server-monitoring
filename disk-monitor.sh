\

#!/bin/bash

# Monitoring configuration
DISK_THRESHOLD=80
MEMORY_THRESHOLD=85

# Log file configuration
LOG_FILE="logs/monitor.log"

# Create the logs directory if necessary
mkdir -p logs

# Collect system information
DISK_USAGE=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')
MEMORY_USAGE=$(free -m | awk '/^Mem:/ {printf "%.0f\n", ($2-$7)/$2*100}')

# Generate a timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "===== LINUX SERVER MONITORING ====="

# Disk monitoring
echo "Current Disk Usage: $DISK_USAGE%"
echo "Disk Warning Threshold: $DISK_THRESHOLD%"

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage has reached the threshold!"
    echo "$TIMESTAMP | DISK | Usage: $DISK_USAGE% | Status: WARNING" >> "$LOG_FILE"
else
    echo "OK: Disk usage is within the acceptable limit."
    echo "$TIMESTAMP | DISK | Usage: $DISK_USAGE% | Status: OK" >> "$LOG_FILE"
fi

echo ""

# Memory monitoring
echo "Current Memory Usage: $MEMORY_USAGE%"
echo "Memory Warning Threshold: $MEMORY_THRESHOLD%"

if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then
    echo "WARNING: Memory usage has reached the threshold!"
    echo "$TIMESTAMP | MEMORY | Usage: $MEMORY_USAGE% | Status: WARNING" >> "$LOG_FILE"
else
    echo "OK: Memory usage is within the acceptable limit."
    echo "$TIMESTAMP | MEMORY | Usage: $MEMORY_USAGE% | Status: OK" >> "$LOG_FILE"
fi

echo ""
echo "Monitoring completed. Results saved to $LOG_FILE"

