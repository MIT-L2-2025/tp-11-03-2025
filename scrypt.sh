#!/bin/bash

# 1. Télécharger le fichier contenant les coordonnées GPS des villes de France
wget -q "http://perso.ens-lyon.fr/etienne.moutot/static/teach/2018-2019/asr2/OSMTowns.txt" -O OSMTowns.txt

# 2. Compter le nombre de villes
echo "Nombre de villes dans le fichier :"
wc -l OSMTowns.txt

# 3. Trouver la ville la plus à l'Ouest et la ville la plus à l'Est
echo "Ville la plus à l'Ouest :"
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1

echo "Ville la plus à l'Est :"
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | tail -n 1

# 4. Script pour afficher les coordonnées GPS d'une ville
echo 'Créer un script "coordonnees.sh"'
cat << 'EOF' > coordonnees.sh
#!/bin/bash
LATLONG=$(grep "^$1 " OSMTowns.txt | head -n1)
LAT=$(echo "$LATLONG" | cut --delimiter " " --fields=3)
LONG=$(echo "$LATLONG" | cut --delimiter " " --fields=2)
echo "La ville $1 a pour latitude $LAT et longitude $LONG"
EOF
chmod +x coordonnees.sh

# 5. Script pour afficher un lien OpenStreetMap pour une ville donnée
echo 'Créer un script "map.sh"'
cat << 'EOF' > map.sh
#!/bin/bash
LATLONG=$(grep "^$1 " OSMTowns.txt | head -n1)
LAT=$(echo "$LATLONG" | cut --delimiter " " --fields=3)
LONG=$(echo "$LATLONG" | cut --delimiter " " --fields=2)
echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"
EOF
chmod +x map.sh

# 6. Trouver les villes contenant "chien" dans leur nom
echo "Villes contenant 'chien' :"
grep "chien" OSMTowns.txt

# Trouver les villes contenant "Chat" ou "chat"
echo "Villes contenant 'Chat' ou 'chat' :"
grep -i "chat" OSMTowns.txt