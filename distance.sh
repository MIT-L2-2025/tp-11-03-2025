#!/bin/bash

LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
Lyon=$(grep Lyon OSMTowns.txt|head -n1)
if [ -z "$LATLONG" ];
then
    echo "Nom de ville non trouvé"
    exit 1
fi
Lyon_Lat=$(echo "$Lyon" |cut -d$'\t' --fields=3)
Lyon_long=$(echo "$Lyon" |cut -d$'\t' --fields=2)
LAT=$(echo "$LATLONG" |cut -d$'\t' --fields=3)
LONG=$(echo "$LATLONG" |cut -d$'\t' --fields=2)

distance=$(python3 gps-dist.py "$LAT" "$LONG" "$Lyon_Lat" "$Lyon_long")
echo "$distance"
