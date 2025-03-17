#!/bin/bash
LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)

# We use a head as the output might contain multiple city
# named the same way.
LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "La ville $1 a pour latitude $LAT et longitude $LONG"
echo "lien: https://www.openstreetmap.org/#map=18/ $LAT e/ $LONG"
