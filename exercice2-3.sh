##########################EXOS 2###################################################
#######  3  Ville la plus a l est et le plus a l ouest ####################
#!/bin/bash
cmd_est="LANG=EN sort -t $'\t' -k2,2n OSMTowns.txt | tail -n 1"
cmd_ouest="LANG=EN sort -t $'\t' -k2,2n OSMTowns.txt | head -n 1"

ville_est=$(eval "$cmd_est")
ville_ouest=$(eval "$cmd_ouest")
echo "La ville la plus à l'est est : $ville_est"
echo "La ville la plus à l'ouest est : $ville_ouest"

##### 4  Recherche la ligne correspondant au premier argument dans le fichier OSM.txt##########

LATLONG=$(grep -P "^$1\s" OSMTowns.txt | head -n 1)

if [ -z "$LATLONG" ]; then
  echo "Aucune donnée trouvée pour $1"
  exit 1
fi
LAT=$(echo "$LATLONG" | cut -d$'\t' -f3)
LON=$(echo "$LATLONG" | cut -d$'\t' -f2)

echo "$1 a pour coordonne LON=$LON et LAT=$LAT"

#### 5 Recherche la ligne correspondant au premier argument dans le fichier OSM.txt#####

#!/bin/bash
LATLONG=$(grep -P "^$1\s" OSMTowns.txt | head -n 1)

if [ -z "$LATLONG" ]; then
  echo "Aucune donnée trouvée pour $1"
  exit 1
fi
LAT=$(echo "$LATLONG" | cut -d$'\t' -f3)
LON=$(echo "$LATLONG" | cut -d$'\t' -f2)
echo "https://www.openstreetmap.org/#map=18/$LAT/$LON"

#### 6 cherche les occurrences sans casse de chat et chien########
grep "\(chat\|Chat\)" OSMTowns.txt


##########################EXOS 3###################################################

#### 1 distance a Lyon (distance.sh) ######
#!/bin/bash

#  pour extraire la latitude et la longitude d'une ville
get_lat_lon() {
  grep -P "^$1\s" OSMTowns.txt | head -n 1 | awk -F'\t' '{print $3, $2}'
}

read LAT_B LON_B <<< $(get_lat_lon "$1")
read LAT_A LON_A <<< $(get_lat_lon "Lyon")

if [ -z "$LAT_B" ] || [ -z "$LON_B" ]; then
  echo "Aucune donnée trouvée pour $1"
  exit 1
fi
echo $(python3 gps-dist.py $LAT_A $LON_A $LAT_B $LON_B)





### 2 premiere image correspondant a l'argument (image.sh)#############################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <nom_de_la_ville>"
    exit 1
fi
city="$1"

# Remplacer les espaces par des underscores pour correspondre au format des titres Wikipedia
city_url=$(echo "$city" | sed 's/ /_/g')

# URL de l'API MediaWiki (ici sur fr.wikipedia.org) pour récupérer la propriété "pageimages" avec l'image originale
api_url="https://fr.wikipedia.org/w/api.php?action=query&titles=${city_url}&prop=pageimages&piprop=original&format=xml"

image_url=$(curl -s "$api_url" | grep -o 'source="[^"]*"' | head -n 1 | sed 's/source="//; s/"//')

if [ -z "$image_url" ]; then
    echo "Aucune image trouvée pour '$city'."
    exit 1
fi
echo "$image_url"





## 3 avec description sur l image ##########################
#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <nom_de_la_ville>"
    exit 1
fi
city="$1"
#  Récupérer l'image de la ville
image_url=$(bash image.sh "$city")

if [ -z "$image_url" ]; then
    echo "Aucune image trouvée pour '$city'."
    exit 1
fi

# Calculer la distance entre la ville et Lyon
distance=$(bash distance.sh "$city")

if [ -z "$distance" ]; then
    echo "Erreur de calcul de la distance."
    exit 1
fi

# Télécharger l'image
wget -O "${city}.jpg" "$image_url"

# Ajouter le texte de la distance sur l'image avec ImageMagick
convert "${city}".jpg -gravity south -background black -fill white -pointsize 40 -splice 0x50 -annotate +0+10 "Distance à Lyon : ${distance} km" "${city}.jpg"

echo "Image créée : ${city}.jpg"






##### 4 nouveau image.sh qui prend en entrée n (nombre d image à retourner)#####
#!/bin/bash
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <nom_de_la_ville> [nombre_images]"
    exit 1
fi
city="$1"
num_images="${2:-1}"  # Par défaut, on récupère 1 image

city_url=$(echo "$city" | sed 's/ /_/g')

# URL de l'API Wikimedia Commons
api_url="https://commons.wikimedia.org/w/api.php?action=query&generator=search&gsrsearch=$city_url&gsrlimit=$num_images&prop=imageinfo&iiprop=url&format=json"

# Récupérer les URLs des images
image_urls=$(curl -s "$api_url" | jq -r '.query.pages[].imageinfo[0].url' 2>/dev/null)

if [ -z "$image_urls" ]; then
    echo "Aucune image trouvée pour '$city'."
    exit 1
fi
echo "$image_urls"


######## 4 collage avec n^2 images ###
#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <image1> <image2> ... <imageN>"
    exit 1
fi
num_images=$#
grid_size=$(echo "sqrt($num_images)" | bc)


if [ $(echo "$grid_size * $grid_size" | bc) -ne "$num_images" ]; then
    echo "Le nombre d'images doit être un carré parfait (ex: 4, 9, 16...)."
    exit 1
fi

temp_dir=$(mktemp -d)
for img in "$@"; do
    filename=$(basename "$img")
    convert "$img" -gravity south -pointsize 20 -background White -splice 0x30 -annotate +0+5 "$filename" "$temp_dir/$filename"
done

# Générer la mosaïque
montage "$temp_dir"/* -tile "${grid_size}x${grid_size}" -geometry +5+5 mosaic.png
echo "Mosaïque générée : mosaic.png"
rm -r "$temp_dir"




