#!/bin/bash


# compter le nombre de ville:

echo "le nombre de ville est:"
wc -l OSMTowns.txt

# ville la plus a l'ouest 

echo "la ville la plus a l'Ouest est:"
sort -k2 -t $'\t' -g OSMTowns.txt| head -n1

# ville plus a l'est

echo "la ville la plus a l'Est est: "
sort -k2 -t $'\t' -g OSMTowns.txt| tail -n1




