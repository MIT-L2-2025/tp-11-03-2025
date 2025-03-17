#!/bin/bash
LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
# tabulation character
# We use a head as the output might contain multiple city
# named the same way.
LAT=$(echo "$LATLONG" |cut -f3)
LONG=$(echo "$LATLONG" |cut -f2)
echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"
