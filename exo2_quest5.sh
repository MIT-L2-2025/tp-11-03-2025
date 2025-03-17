#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Mettre le nom de la ville en paramètre"
  exit 1
fi

name=$(grep "^$1" OSMTowns.txt | head -n1)

if [ -z "$name" ]; then
  echo "Ville non trouvée"
  exit 1
fi

name=$(echo "$name" | tr -s '[:space:]' ' ')

latitude=$(echo "$name" | cut -d" " -f3)
longitude=$(echo "$name" | cut -d" " -f2)

link="https://www.openstreetmap.org/#map=18/$latitude/$longitude"

echo "Voici le lien vers OpenStreetMap : $link"

