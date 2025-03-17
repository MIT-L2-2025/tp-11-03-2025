#!/bin/bash

LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)

LAT=$(echo "$LATLONG" |cut --delimiter=" " --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter=" " --fields=2)

if [ $# -gt 0 ]; then
	echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"
else
	echo ""
fi

echo "\n\n\n\n"


echo "tri des nom qui contient chien ou chat :"
grep "chien" OSMTowns.txt
grep -E "(chat|Chat)" OSMTowns.txt
