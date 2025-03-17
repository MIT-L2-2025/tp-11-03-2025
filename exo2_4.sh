#!/bin/bash

LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=3 | head -n 1



LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
#
#^ tabulation character
# We use a head as the output might contain multiple city
# named the same way.
LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
#echo "La ville $1 a pour latitude $LAT et longitude $LONG"
echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"
grep "chien" OSMTowns.txt
grep "\(chat\|Chat\)" OSMTowns.txt
