#!/bin/bash

echo "🔍 Recherche du processus qui consomme le plus de CPU..."

# Utiliser 'ps' pour trier par utilisation CPU et afficher le premier
top_process=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -2 | tail -1)

# Extraire les informations
pid=$(echo "$top_process" | awk '{print $1}')
nom_process=$(echo "$top_process" | awk '{print $2}')
cpu_usage=$(echo "$top_process" | awk '{print $3}')

# Afficher le résultat
echo " Processus le plus gourmand en CPU :"
echo " PID       : $pid"
echo " Nom       : $nom_process"
echo " CPU (%)   : $cpu_usage"

# Optionnel : Afficher les détails complets du processus
echo -e "\n📊 Détails du processus :"
ps -p "$pid" -o pid,ppid,comm,%cpu,%mem,etime

exit 0
