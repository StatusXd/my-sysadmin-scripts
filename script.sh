#!/usr/bin/env bash
#script.sh - мониторинг ресурсов(Вариант - Б)
#Раз в N секунд записывает результаты free -h, df -h и uptime в monitoring.log

INTERVAL=5
LOG_FILE="monitoring.log"

#Выход по Ctrl+C
trap 'echo "	Остановленно пользователем!"; exit 0' INT

echo "Мониторинг запущен. Интервал %{INTERVAL}s, лог: ${LOG_FILE}. Ctrl+C - остановить."

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
