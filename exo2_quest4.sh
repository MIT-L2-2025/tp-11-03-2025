#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Mettre le nom de la ville en paramètre"
  exit 1
fi
name=`grep "^$1" OSMTowns.txt|head -n1`
latitude=`"$1"| cut -d" " -f3`
longitude=`"$1"| cut -d" " -f`
echo "La ville $1 a pour latitude :$latitude et longitude: $longitude"  
