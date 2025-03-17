#!/bin/bash

# Nombre de Ville 
nbr=$(wc -l OSMTowns.txt | cut -d" " -f1) 
echo "Nombre de ville : $nbr villes"
