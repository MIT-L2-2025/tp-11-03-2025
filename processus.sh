#!/bin/bash

# Seuil en pourcentage (70%)
SEUIL=70

# Récupère les processus triés par utilisation CPU, exclut l'en-tête et parcourt chaque ligne
ps aux --sort=-%cpu | tail -n +2 | while read -r user pid cpu mem rest; do
    # Convertit le CPU (qui peut avoir des décimaux) en nombre entier pour la comparaison
    cpu_int=$(printf "%.0f" "$cpu")
    
    # Vérifie si l'utilisation CPU dépasse le seuil
    if [ "$cpu_int" -gt "$SEUIL" ]; then
        echo "Processus $pid ($user) utilise $cpu% CPU - Tentative d'arrêt..."
        # Tue le processus avec kill
        kill -9 "$pid"
        
        # Vérifie si le processus a bien été tué
        if [ $? -eq 0 ]; then
            echo "Processus $pid arrêté avec succès."
        else
            echo "Échec de l'arrêt du processus $pid."
        fi
    fi
done
