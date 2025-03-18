LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
#
#^ tabulation character
# We use a head as the output might contain multiple city
# named the same way.
ville_lat=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
ville_long=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "La ville $1 a pour latitude $ville_lat et longitude $ville_long"

LATLONG=$(grep "Lyon" OSMTowns.txt|head -n1)
Lyon_lat=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
Lyon_long=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "La ville de Lyon a pour latitude $Lyon_lat et longitude $Lyon_long"
python3 gps-dist.py $Lyon_lat $Lyon_long $ville_lat $ville_long
