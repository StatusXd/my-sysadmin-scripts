#!/usr/bin/env bash
#script.sh - мониторинг ресурсов(Вариант - Б)
#Раз в N секунд записывает результаты free -h, df -h и uptime в monitoring.log

set -u

INTERVAL=5			# период опроса
LOG_FILE="monitoring.log"	# файл, куда производится запись логов

# Проверка на существование нужных команд в системе
for cmd in free df uptime; do
	if ! command -v "$cmd" > /dev/null 2>&1; then
		echo "error: Команда '$cmd' не найдена в системе" >&2
		exit 1
	fi
done

# Проверка на возможность записи в файл лога
if ! touch "$LOG_FILE" 2>/dev/null; then
	echo "error: Нет прав на запись в $LOG_FILE" >$2
	exit 1
fi

# Выход по Ctrl+C
trap 'echo "	Остановленно пользователем!"; exit 0' INT

echo "Мониторинг запущен. Интервал ${INTERVAL}сек, лог: ${LOG_FILE}. Ctrl+C - остановить."

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
