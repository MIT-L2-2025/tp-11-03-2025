#!/bin/bash

nbrOfVille=$(wc -l OSMTowns.txt| cut -d' ' -f1)

echo "Il y a $nbrOfVille villes dans le fichier OSMTowns.txt"

echo "La ville la plus à l'OUEST est: "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1

echo ""

echo "La ville la plus à l'EST est: "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2| tail -1
