#!/bin/bash

rep=$(curl -s "https://fr.wikipedia.org/w/api.php?action=query&titles=$1&prop=pageimages&pithumbsize=500&format=json")

link=$(echo "$rep" | jq -r '.query.pages[].thumbnail.source')

echo $link
