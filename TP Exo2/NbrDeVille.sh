#!/bin/bash

nbrOfVille=$(wc -l OSMTowns.txt| cut -d' ' -f1)

echo "Il y a $nbrOfVille villes dans le fichier OSMTowns.txt"

