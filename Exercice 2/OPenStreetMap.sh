#!/bin/bash

LATLONG=$(grep "^$1" OSMTowns.txt | head -n1)
LAT=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=3)
LONG=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=2)
echo "Voici le lien OpenStreetMap pour la ville $1 : https://www.openstreetmap.org/#map=18/$LAT/$LONG"
