#!/bin/bash

LATLONG=$(grep -P "^$1\s" OSM.txt | head -n 1)

if [ -z "$LATLONG" ]; then
  echo "Aucune donnée trouvée pour $1"
  exit 1
fi

LAT=$(echo "$LATLONG" | cut -d$'\t' -f3)
LON=$(echo "$LATLONG" | cut -d$'\t' -f2)


echo "$1 a pour coordonne LON=$LON et LAT=$LAT"
