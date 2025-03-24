#!/bin/bash

LYON=$(grep "Lyon" OSMTowns.txt | head -1)
LYON_LAT=$(echo "$LYON" | cut  -d$'\t' -f 2)
LYON_LONG=$(echo "$LYON" | cut -d$'\t' -f 3)

VILLE=$(grep "$1" OSMTowns.txt | head -1)
VILLE_LAT=$(echo "$VILLE" | cut -d$'\t' -f 2)
VILLE_LONG=$(echo "$VILLE" | cut -d$'\t' -f 3)

#echo "$VILLE_LAT" "$VILLE_LONG"
#echo "$LYON_LAT" "$LYON_LONG"
python3 gps-dist.py $VILLE_LAT $VILLE_LONG $LYON_LAT $LYON_LONG
