#!/bin/bash


LYON=$(grep "Lyon" OSMTowns.txt|head -n 1)
LYON_LAT=$(echo "$LYON" | cut -d$'\t' -f3)
LYON_LON=$(echo "$LYON" | cut -d$'\t' -f2)

CITY=$(grep "$1" OSMTowns.txt|head -n 1)
CITY_LAT=$(echo "$CITY" | cut -d$'\t' -f3)
CITY_LON=$(echo "$CITY" | cut -d$'\t' -f2)

python3 gst-dist.py $LYON_LAT $LYON_LON $CITY_LAT $CITY_LON
