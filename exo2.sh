#!/bin/bash

echo "La ville la plus a l'Ouest de France : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|head -n 1
echo "La ville la plus a l'Est de France  : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|tail -n 1
