#!/bin/bash
read -p "entrer le nom de la ville : " ville
LATLONG=$(grep "$ville" OSMTowns.txt|head -n1)

# We use a head as the output might contain multiple city
# named the same way.
LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "La ville $ville a pour latitude $LAT et longitude $LONG"
echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"
