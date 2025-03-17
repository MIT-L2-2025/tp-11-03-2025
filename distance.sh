#!/bin/bash

LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
if [ -z "$LATLONG" ];
then
    echo "Nom de ville non trouvé"
    exit 1
fi

LAT=$(echo "$LATLONG" |cut -d$'\t' --fields=3)
LONG=$(echo "$LATLONG" |cut -d$'\t' --fields=2)


distance=$(python3 gps-dist.py "$LAT" "$LONG" 45.7511118 4.8273739)
echo "$distance"