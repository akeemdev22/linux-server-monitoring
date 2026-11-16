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



# Set the memory warning threshold
MEMORY_THRESHOLD=85

# Collect current memory usage
MEMORY_USAGE=$(free -m | awk '/^Mem:/ {printf "%.0f\n", ($2-$7)/$2*100}')

echo "===== LINUX MEMORY MONITORING ====="
echo "Current Memory Usage: $MEMORY_USAGE%"
echo "Warning Threshold: $MEMORY_THRESHOLD%"

# Compare memory usage with the threshold
if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then
    echo "WARNING: Memory usage has reached the threshold!"
else
    echo "OK: Memory usage is within the acceptable limit."
fi
