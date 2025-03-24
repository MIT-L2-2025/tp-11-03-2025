#!/bin/bash

echo "1-calcul distance par rapport a Lyon "
echo "2-affichage lien"
read -p "votre choix :" n
case $n in
    1)
        read -p "nom de la ville : " ville
        lat_long_lyon=$(grep "Lyon" "OSMTowns.txt"|head -n1)
        long_lyon=$(echo "$lat_long_lyon" |cut  -f2)
        lat_lyon=$(echo "$lat_long_lyon" |cut  -f3)

        lat_long=$(grep "$ville" "OSMTowns.txt"|head -n1)
        long=$(echo "$lat_long" |cut  -f2)
        lat=$(echo "$lat_long" |cut  -f3)
        python3 gps-dist.py "$lat_lyon" "$long_lyon" "$lat" "$long"
    ;;
    2)
        read -p "nom de la  ville " ville
        API_URL="https://fr.wikipedia.org/w/api.php"

        PARAMS="action=query&titles=${ville}&prop=pageimages&pithumbsize=600&format=json&formatversion=2"

        PARAMS=$(echo -n "$PARAMS" | sed 's/ /%20/g')

        response=$(curl -s "${API_URL}?${PARAMS}")

        if echo "$response" | grep -q "missing"; then
            echo "Erreur : La page pour '$ville' n'existe pas sur Wikipédia en français."
            exit 1
        fi

        image_url=$(echo "$response" | jq -r '.query.pages[0].thumbnail.source // "Aucune image trouvée"')

        if [ "$image_url" = "Aucune image trouvée" ]; then
            echo "Aucune image associée à '$ville' n'a été trouvée."
        else
            echo "Lien de la première image pour '$ville' : $image_url"
        fi

    ;;
    *)
        echo "choix invalide"
    ;;
esac
