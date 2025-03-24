#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <nom_de_ville>"
    exit 1
fi

IMAGE_URL=$(curl -s "https://en.wikipedia.org/w/api.php?action=query&titles=${1}&prop=pageimages&format=json&pithumbsize=500" | jq -r '.query.pages[].thumbnail.source' 2>/dev/null)

if [ "$IMAGE_URL" == "null" ]; then
    echo "Image non trouver $1"
    exit 1
fi 
echo "$IMAGE_URL"
