#!/bin/bash

echo "Les 10 processus qui utilisent le plus de CPU :"
ps aux --sort=-%cpu | head -n 11  # `head -n 11` pour afficher la ligne d'en-tête et les 10 premiers processus

echo "Les 10 processus qui utilisent le plus de mémoire :"
ps aux --sort=-%mem | head -n 11  # `head -n 11` pour afficher la ligne d'en-tête et les 10 premiers processus

echo "Si vous souhaitez tuer un processus, entrez son PID (Identifiant de Processus) :"
read PID

if [ ! -z "$PID" ] && ps -p $PID > /dev/null; then
    echo "Le processus avec PID $PID va être tué..."
    kill -9 $PID
    echo "Processus tué avec succès."
else
    echo "Le PID $PID n'existe pas ou l'entrée est invalide."
fi
