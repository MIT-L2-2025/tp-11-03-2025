#!/bin/bash

CITY=$1
RESPONSE=$(curl -s "https://fr.wikipedia.org/w/api.php?action=query&prop=images&titles=$CITY&format=json")

IMAGE_NAME=$(echo $RESPONSE | jq -r '.query.pages[].images[0].title')

IMAGE_URL="https://upload.wikimedia.org/wikipedia/commons/$(echo $IMAGE_NAME | sed 's/^Fichier://;s/ /_/g')"
echo $IMAGE_URL
