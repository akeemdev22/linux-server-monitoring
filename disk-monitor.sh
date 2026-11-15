\
#!/bin/bash

# Set the disk warning threshold
DISK_THRESHOLD=80

# Collect the current disk usage
DISK_USAGE=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')

echo "===== LINUX DISK MONITORING ====="
echo "Current Disk Usage: $DISK_USAGE%"
echo "Warning Threshold: $DISK_THRESHOLD%"

# Compare disk usage with the threshold
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage has reached the threshold!"
else
    echo "OK: Disk usage is within the acceptable limit."
fi
