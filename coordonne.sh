#!/bin/bash
read -p "Enter the name of city : " ville
LATLONG=$(grep "$ville" OSMTowns.txt|head -n1)

# We use a head as the output might contain multiple city
# named the same way.
LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "$ville city is latitude $LAT and longitude $LONG"
echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"
