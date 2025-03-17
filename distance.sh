#!/bin/bash

BOLD="\033[1m"
NORMAL="\033[0m"
WHITE="\033[37m"
RED="\033[31m"

lat_a=$1
lon_a=$2
lat_b=$3
lon_b=$4

if [ "$#" -eq 0 ]; then
    echo -e "${BOLD}Usage : ${NORMAL} $0 {ville}"
    exit 1
elif [ "$#" -eq 1 ]; then
    lyon="Lyon"
    LYON_LATLONG=$(grep -i "^$lyon"$'\t' OSMTowns.txt | head -n 1)
    LYON_LAT=$(echo "$LYON_LATLONG" | cut --delimiter=$'\t' --fields=3)
    LYON_LONG=$(echo "$LYON_LATLONG" | cut --delimiter=$'\t' --fields=2)
    city=$1
    LATLONG=$(grep -i "^$city"$'\t' OSMTowns.txt | head -n 1)
    if [ -n "$LATLONG" ]; then
        LAT=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=3)
        LONG=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=2)
        RES=$(python3 gps-dist.py $LAT $LONG $LYON_LAT $LYON_LONG)
        echo -e "La distance entre ${BOLD}${city}${NORMAL} et ${BOLD}${lyon}${NORMAL} est de ${BOLD}${RES} km${NORMAL}."
    else
        echo -e "Ville ${BOLD}${city}${NORMAL} non trouvée."
    fi
else
    echo "Erreur"
fi
