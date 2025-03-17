#!/bin/bash
LATLONG=$(grep "^$1	" OSMTowns.txt|head -n1)
LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "https://ww.openstreetmap.org/#map=18/$LAT/$LONG"
echo " "
echo " "
grep "chien" OSMTowns.txt
grep -i "chat" OSMTowns.txt
