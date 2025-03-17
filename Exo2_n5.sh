#!/bin/bash

#https://www.openstreetmap.org/#map=18/45.72980/4.82712 (en remplaçant
#45.72980 par la latitude de la ville et 4.82712 par sa longitude)

LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)

if [ -z "$LATLONG" ];
then
    echo "Nom de ville non trouvé"
    exit 1
fi

LAT=$(echo "$LATLONG" |cut -d$'\t' --fields=3)
LONG=$(echo "$LATLONG" |cut -d$'\t' --fields=2)

echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"