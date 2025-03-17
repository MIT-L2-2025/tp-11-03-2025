#!/bin/bash

PHighCPU=$(top -o %CPU|head -n 8|tail -n 1)
CPU=$(echo "$PHighCPU" | awk '{print $10}')
PID=$(echo "$PHighCPU" | awk '{print $2}')
echo " utilisation de CPU le plus élevé: processus n°$PID , $CPU%"
if  [[ $CPU -gt 70 ]];
then
    kill "$PID"
fi
