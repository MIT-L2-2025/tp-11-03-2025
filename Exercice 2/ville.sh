#!/bin/bash

# Ville la plus à l'Ouest
echo "La ville la plus à l'Ouest est : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1

# Ville la plus à l'Ouest
echo "La ville la plus à l'Est est : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | tail -n 1

