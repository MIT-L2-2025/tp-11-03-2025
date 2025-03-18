#!/bin/bash
ville="$1"
ligne=$(grep -m1 "^$ville	" OSMTowns.txt)
longitude=$(echo "$ligne" | cut -d $'\t' -f2)
latitude=$(echo "$ligne" | cut -d $'\t' -f3)
echo "Lien : "
echo "https://www.openstreetmap.org/#map=18/$latitude/$longitude"

