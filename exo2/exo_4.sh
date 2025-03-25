#!/bin/bash




LATLONG=$(grep "$1	" OSMTowns.txt|head -n1)



LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)


LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)


echo "La ville $1 a pour latitude $LAT et longitude $LONG"
