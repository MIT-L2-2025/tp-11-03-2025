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

LAT=$(echo "$LATLONG" | cut -d$'\t' -f 2)
LONG=$(echo "$LATLONG" | cut -d$'\t' -f 3)

echo "la ville $T a pour latitude $LAT et longitude $LONG"
