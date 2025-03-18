#!/bin/bash
ville="$1"
#ligne=$(grep -m1 "^$ville"$'\t' OSMTowns.txt)
ligne=$(grep -m1 "^$ville	" OSMTowns.txt)
longitude=$(echo "$ligne" | cut -d $'\t' -f2)
latitude=$(echo "$ligne" | cut -d $'\t' -f3)
echo "La ville $1 a pour latitude $latitude et longitude $longitude"
