#!/usr/bin/env bash
#script.sh - мониторинг ресурсов(Вариант - Б)
#Раз в N секунд записывает результаты free -h, df -h и uptime в monitoring.log

INTERVAL=5
LOG_FILE="monitoring.log"

while true; do
	{
	echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
	free -h
	df -h
	uptime
	echo
	} >> "$LOG_FILE"
	sleep "$INTERVAL"
done
