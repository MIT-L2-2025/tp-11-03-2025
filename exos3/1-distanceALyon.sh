#!/bin/bash

# Fonction pour extraire la latitude et la longitude d'une ville
get_lat_lon() {
  grep -P "^$1\s" OSMTowns.txt | head -n 1 | awk -F'\t' '{print $3, $2}'
}

# Récupère les coordonnées de la ville spécifiée et de Lyon
read LAT_B LON_B <<< $(get_lat_lon "$1")
read LAT_A LON_A <<< $(get_lat_lon "Lyon")

# Vérifie si les coordonnées de la ville spécifiée ont été trouvées
if [ -z "$LAT_B" ] || [ -z "$LON_B" ]; then
  echo "Aucune donnée trouvée pour $1"
  exit 1
fi

# Calcule la distance et l'affiche
DIST=$(python3 gps-dist.py $LAT_A $LON_A $LAT_B $LON_B)
echo $DIST