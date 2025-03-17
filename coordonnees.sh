#!/bin/bash
nom_fichier="OSMTowns.txt"
LATLONG=$(grep "^$1	" $nom_fichier | head -n 1)
LAT=$(echo "$LATLONG" |cut -d "	" -f 3)
LONG=$(echo "$LATLONG" |cut -d "	" -f 2)
echo -e "Nom du ville:$1\nLatitude: $LAT\nLongitude: $LONG"
echo -e "Lien: https://www.openstreetmap.org/#map=18/$LAT/$LONG"
