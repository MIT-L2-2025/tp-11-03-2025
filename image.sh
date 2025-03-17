#!/bin/bash

TOWN="$1" 
API_URL="https://fr.wikipedia.org/w/api.php"

IMAGE_LIST=$(curl -s "$API_URL?action=query&format=json&prop=images&titles=$TOWN&imlimit=1")

IMAGE_NAME=$(echo "$IMAGE_LIST" | jq -r '.query.pages | to_entries[0].value.images[0].title')

if [ -z "$IMAGE_NAME" ] || [ "$IMAGE_NAME" == "null" ]; then
    echo "No image found for the town: $TOWN"
    exit 1
fi

IMAGE_INFO=$(curl -s "$API_URL?action=query&format=json&prop=imageinfo&titles=$IMAGE_NAME&iiprop=url")

IMAGE_URL=$(echo "$IMAGE_INFO" | jq -r '.query.pages | to_entries[0].value.imageinfo[0].url')

if [ -z "$IMAGE_URL" ] || [ "$IMAGE_URL" == "null" ]; then
    echo "No image URL found for the image: $IMAGE_NAME"
    exit 1
fi

echo "First image URL for $TOWN: $IMAGE_URL"
