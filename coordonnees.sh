#!/bin/bash 

LATLONG=$(grep "^$1	" OSMTowns.txt | head -n1)

LAT=$(echo "$LATLONG" | awk -F' ' '{print $4}')
LONG=$(echo "$LATLONG" | awk -F' ' '{print $3}')
echo "La ville $1 a pour latitude $LAT et longitude $LONG"
