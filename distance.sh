#!/bin/bash/

lat_long_lyon=$(grep "Lyon" "OSMTowns.txt"|head -n1)
long_lyon=$(echo "$lat_long_lyon" |cut  -f2)
lat_lyon=$(echo "$lat_long_lyon" |cut  -f3)

lat_long=$(grep "$1" "OSMTowns.txt"|head -n1)
long=$(echo "$lat_long" |cut  -f2)
lat=$(echo "$lat_long" |cut  -f3)

python3 gps-dist.py "$lat_lyon" "$long_lyon" "$lat" "$long"

