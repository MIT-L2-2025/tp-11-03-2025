#!/bin/bash




LATLONG=$(grep "$1	" ../OSMTowns.txt | head -n1)

#recuperation du nombre de ligne
LN=$(grep -n "$1	" ../OSMTowns.txt | head -n1 | cut -d: -f1)


LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)


LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)


echo "https://www.openstreetmap.org/#map=$LN/$LAT/$LONG"
