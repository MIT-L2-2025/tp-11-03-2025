#!/bin/bash


ville=$1
link=$(curl -s "https://fr.wikipedia.org/w/api.php?action=query&titles=$VILLE&prop=pageimages&pithumbsize=500&format=json")
imLink=$(echo "$link" | jq -r '.query.pages[].thumbnail.source')


echo $imLink
