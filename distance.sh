#!/bin/bash

LYON_LAT=$(grep "Lyon" OSMTowns.txt | head -n 1 | awk -F'\t' '{print $3}')
LYON_LONG=$(grep "Lyon" OSMTowns.txt | head -n 1 | awk -F'\t' '{print $2}')

TOWN=$(grep "^$1"$'\t' OSMTowns.txt | head -n 1)
LAT=$(echo "$TOWN" | awk -F'\t' '{print $3}')
LONG=$(echo "$TOWN" | awk -F'\t' '{print $2}')

echo "Lyon: $LYON_LAT $LYON_LONG"
echo "Town: $LAT $LONG"

echo "Distance: $(python3 gps-dist.py "$LYON_LAT" "$LYON_LONG" "$LAT" "$LONG")"
