#!/bin/bash

# Function to clear the screen
clear_screen() {
  clear || printf "\033c"
}

# Function to display system resource information
display_resources() {
  clear_screen

  # CPU Usage
  cpu_usage=$(top -bn1 | grep '%Cpu' | awk '{print $2}')
  echo "CPU Usage: $cpu_usage%"

  # Memory Consumption
  memory_info=$(free -m | awk 'NR==2{print}')
  total_memory=$(echo "$memory_info" | awk '{print $2}')
  used_memory=$(echo "$memory_info" | awk '{print $3}')
  available_memory=$(echo "$memory_info" | awk '{print $NF}')
  echo "Memory Usage: $used_memory MB / $total_memory MB (Available: $available_memory MB)"

  # Disk Usage
  disk_info=$(df -h / | awk 'NR==2{print}')
  total_disk=$(echo "$disk_info" | awk '{print $2}')
  used_disk=$(echo "$disk_info" | awk '{print $3}')
  available_disk=$(echo "$disk_info" | awk '{print $4}')
  echo "Disk Usage: $used_disk / $total_disk (Available: $available_disk)"

  echo
}

# Clear the screen before displaying resource information
clear_screen

# Continuous resource monitoring
while true; do
  display_resources
  sleep 2
done
