#!/bin/bash


ville=$1
image=$(bash ./image $ville)
dLion=$(bash ./distance $ville)

echo "$image"
mkdir "$ville"

curl "$image" > "$ville"/input.jpg 

convert "$ville"/input.jpg -gravity south -pointsize 50 -fill white -annotate +0+10 "$ville: $dLion km de Lyon" $ville/output.jpg
