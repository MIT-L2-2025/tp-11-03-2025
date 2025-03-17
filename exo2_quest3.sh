#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Mettre le nom de la ville en paramètre"
  exit 1
fi
name=$(grep "^$1" OSMTowns.txt|head -n1)
# Vérification si la ville a été trouvée
if [ -z "$name" ]; then
  echo "Ville non trouvée"
  exit 1
fi
name=$(echo "$name" | tr -s '[:space:]' ' ')  #remplacer les espaces mutliples et tabulation par un seul espace
latitude=$(echo "$name" |cut -d" " -f2)
longitude=$(echo "$name" |cut -d" " -f2)
echo "La ville $1 a pour latitude :$latitude et longitude: $longitude"  
