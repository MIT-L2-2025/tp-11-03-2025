#!/bin/bash

function affiche_ligne {
    read -p "Fichier : " fic
    [[ ! -f $fic ]] && echo "$fic n'est pas un fichier" && return
    echo -e "[1]. Depart -> Arret\n[2]. Lignes specifiques" && read ch
    case "$ch" in
        1)  read -p "Nb ligne de depart : " depart; read -p "Nb ligne d'arret : " arret
            (( depart > arret )) && echo "Lignes invalides !" || cat -n "$fic" | head -"$arret" | tail -$((arret - depart + 1)) ;;
        2)  read -p "Lignes a afficher : " -a tab
            for((i=0; i<${#tab[@]}; i++));do
				echo "$(cat -n $fic | head -${tab[$i]} | tail -1)"
			done
    esac
}

function kill_proc {
    proc=$(top -b -n 1 | awk 'NR>7' | head -n 1)
    cpu=$(echo "$proc" | awk '{print $9}'); mem=$(echo "$proc" | awk '{print $10}')
    if [[ $cpu -gt 70 || $mem -gt 70 ]]; then
        pid=$(echo "$proc" | awk '{print $1}'); p_name=$(echo "$proc" | awk '{print $12}')
        sudo kill -9 "$pid" && echo "Killing $p_name..."
    else 
        echo "Aucun processus au-dessus de 70%."
    fi
}

while true; do
    echo -e "[1]. Affichage ligne specifique\n[2]. Coordonnees d'une ville\n[3]. Chercher mot dans un fichier\n[4]. Kill un proc +70% (mem / cpu)"
    read -p "[exit]. Quitter -> " choix
    [[ "$choix" == "exit" ]] && break

    case "$choix" in
        1) affiche_ligne ;;
        2) bash coordonne.sh ;;
        3)  read -p "Mot a rechercher : " mot; read -p "Fichier : " fic
            [[ ! -f $fic ]] && echo "$fic n'est pas un fichier" || grep -i "$mot" "$fic" || echo "Aucun $mot trouvé." ;;
        4) kill_proc ;;
    esac
done

echo "Exiting..."
