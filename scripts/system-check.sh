#!/usr/bin/env bash
echo "=== Host ===";    hostname; uptime
echo "=== Memory ===";  free -h
echo "=== Disk ===";    df -h / | tail -n 2
echo "=== Top 5 processes by CPU ==="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo "=== Docker ===";  systemctl is-active docker
echo "=== Listening ports ==="; ss -tuln | head -n 15
