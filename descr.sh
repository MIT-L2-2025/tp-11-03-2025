#!/bin/bash

CITY=$1

IMAGE_URL = $(sh image.sh $1)
curl -s -o city_image.jpg $IMAGE_URL

CITY_LAT=$(echo $RESPONSE | jq -r '.query.pages[].coordinates[0].lat')
CITY_LON=$(echo $RESPONSE | jq -r '.query.pages[].coordinates[0].lon')

DISTANCE=$(python3 gst-dist.py $LYON_LAT $LYON_LON $CITY_LAT $CITY_LON)

TEXT="Distance à Lyon: $DISTANCE km"

convert city_image.jpg -gravity South -pointsize 24 -stroke black -strokewidth 2 -fill white -annotate +0+20 "$TEXT" image.jpg

rm city_image.jpg

echo "L'image avec la distance à Lyon a été créée sous le nom image.jpg."
