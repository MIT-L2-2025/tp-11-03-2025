#!/bin/bash

echo "hello world"

for i in {1..100};do
	if [ $(($i%3)) -eq 0 ]; then
		echo $i
	fi
done

# 1. Créer un fichier "hello" et y mettre le script Hello World
echo -e '#!/bin/bash\necho "Hello, World!"' > hello
chmod +x hello  # Donner les permissions d'exécution
./hello         # Exécuter le script

# 2. Compter le nombre de fichiers/répertoires dans le dossier courant
echo "Nombre de fichiers/répertoires :"
ls | wc -l

# 3. Afficher le modèle du CPU
echo "Modèle du CPU :"
cat /proc/cpuinfo | grep "model name" | uniq

# 4. Afficher le premier argument du script
echo "Premier argument : $1"

# 5. Afficher tous les arguments
echo "Tous les arguments : $@"

# 6. Afficher tous les arguments, un par ligne
echo "Arguments un par ligne :"
for arg in "$@"; do
    echo "$arg"
done

# 7. Vérifier et supprimer file2 si file1 existe
if [[ -f "$1" && -f "$2" ]]; then
    rm "$2"
    echo "Fichier $2 supprimé car $1 existe."
else
    echo "Condition non remplie : soit $1 n'existe pas, soit $2 n'est pas un fichier."
fi

