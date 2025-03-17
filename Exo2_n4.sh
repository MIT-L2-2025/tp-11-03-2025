#!/bin/bash

LATLONG=$(grep "^$1 " OSMTowns.txt|head -n1)

if [ -z "$LATLONG" ];
then
    echo "Nom de ville non trouvé"
    exit 1
fi
#^ tabulation character
# We use a head as the output might contain multiple city
# named the same way.
LAT=$(echo "$LATLONG" |cut -d$'\t' --fields=3)
LONG=$(echo "$LATLONG" |cut -d$'\t' --fields=2)
echo "La ville $1 a pour latitude $LAT et longitude $LONG"