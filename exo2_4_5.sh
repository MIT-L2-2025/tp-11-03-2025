#!/bin/bash
echo "4)Retour coordoonées d'une ville:"
lat_long=$(grep "$1" "OSMTowns.txt"|head -n1)
long=$(echo "$lat_long" |cut  -f2)
lat=$(echo "$lat_long" |cut  -f3)

echo "La ville $1 a pour longitude $long et latitude $lat"
echo "lien:"
echo "https://www.openstreetmap.org/#map=18/$lat/$long"
