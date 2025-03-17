#!/bin/bash

ville_ouest=""
ville_est=""
longitude_ouest=999
longitude_est=-999

# Lire le fichier ligne par ligne
while IFS=$'\t' read -r ville longitude latitude; do
    # Ignorer l'entête
    if [[ "$ville" == "NomVille" ]]; then
        continue
    fi

    # Comparer la longitude pour trouver la ville la plus à l'ouest
    if [ "$(echo "$longitude < $longitude_ouest" | bc -l)" -eq 1 ]; then
        longitude_ouest=$longitude
        ville_ouest=$ville
    fi

    # Comparer la longitude pour trouver la ville la plus à l'est
    if [ "$(echo "$longitude > $longitude_est" | bc -l)" -eq 1 ]; then
        longitude_est=$longitude
        ville_est=$ville
    fi
done < OSMTowns.txt

# Afficher le résultat
echo "Ville la plus à l'ouest : $ville_ouest ($longitude_ouest)"
echo "Ville la plus à l'est : $ville_est ($longitude_est)"

