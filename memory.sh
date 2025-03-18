#!/bin/bash

MEM_MAX=0
LIMIT_CPU=70

echo "PID    %MEM    %CPU    NAME"
echo "---------------------------"

while read line; do
    PID=$(echo "$line" | awk '{print $1}')
    MEM=$(echo "$line" | awk '{print $2}')
    CPU=$(echo "$line" | awk '{print $3}')
    NAME=$(echo "$line" | awk '{print $4}')

    printf "%-6s %-6s %-6s %s\n" "$PID" "$MEM" "$CPU" "$NAME"

    if [ $(echo "$MEM > $MEM_MAX" | bc) -eq 1 ]; then
        MEM_MAX=$MEM
    fi

    if [ $(echo "$CPU > $LIMIT_CPU" | bc) -eq 1 ]; then
        echo "-> $PID utilise $CPU% de CPU (> $LIMIT_CPU%), limitation à 55%..."
        cpulimit -p "$PID" -l 55 &
    fi
done < <(ps -eo pid,%mem,%cpu,comm --sort=-%cpu | tail -n +2)

echo "Mémoire maximale utilisée : $MEM_MAX %"
echo "Analyse terminée !"