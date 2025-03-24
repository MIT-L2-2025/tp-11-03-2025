#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Utilisation: descr.sh nom_de_ville"
fi
ville=$1
distance=$(bash distance.sh $ville)

curl $(bash image.sh $1) > image.jpg
convert image.jpg -gravity south -pointsize 50 -fill white -annotate +0+10 "$ville: $distance km de LYON" img_With_Legend.jpg

