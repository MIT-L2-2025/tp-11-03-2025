#!/bin/bash

#2e colonne indique la longitude
ville_plus_Est=$(LANG=EN  sort -t $'\t' OSMTowns.txt -nr --key=2|head -n 1)
echo  $ville_plus_Est": la ville la plus à l'Est" 
ville_plus_Ouest=$(LANG=EN sort -t $'\t' OSMTowns.txt -n  --key=2|head -n 1)
echo $ville_plus_Ouest":la ville la plus à l'ouest"

