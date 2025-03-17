#!/bin/bash

numOfArg=0
default="Pré-la-Joux"
T=""

if [ $# -lt 1  ]; then
		T=$default
	else 
		T=$1
fi

LATLONG=$(grep "^$T" OSMTowns.txt | head -1)

LAT=$(echo "$LATLONG" | cut -d$'\t' -f 3)
LONG=$(echo "$LATLONG" | cut -d$'\t' -f 2)

echo "Lien Openstreet pour la ville $T:https://www.openstreetmap.org/#map=18/$LAT/$LONG"
