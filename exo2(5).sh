#!/bin/bash

if[ $# -eq 0 ]; then
	echo "Mettre le nom de la ville en parametre"
	exit 1
fi

name=$(grep "^$1" OSMTowns.txt|head -n1)
if[ -z "$name" ];then
	echo "Ville non trouvée"
	exit 1
fi
name=$(echo "$name" | tr -s '[:space:]' ' ')

latitude=$(echo "$name" |cut -d" " -f2)
longitude=$(echo "$name" |cut -d" " -f2)
echo "La ville $1 a pour latitude :$latitude et longitude: $longitude"

link="https://www.openstreetmap.org/#map=18/$latitude/$longitude"

echo "Voici le lien vers OpenStreetMap : $link"
