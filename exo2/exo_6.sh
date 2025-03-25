#!/bin/bash



#affiche les ville ou il y a 'chien' et 'chat'ou 'Chat'

choix=0;


if [ -z $1 ]
then
	echo "Fichier introuvable"
	exit 1
fi


echo "1) Les nom de ville cotenant 'chien'"
echo "2) Les nom de ville contenant 'chat' ou 'Chat'"

read -p "Entrer votre choix : " choix


case $choix in
	1)
		grep "chien" $1
		;;

	2)
		grep -i "chat" $1
		;;
	*)
		echo "Choix invalide"
		;;
esac
