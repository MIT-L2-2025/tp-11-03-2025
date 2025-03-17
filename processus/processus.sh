#!/bin/bash

# Fonction pour afficher le processus utilisant le plus de RAM
show_top_ram() {
    echo "Processus utilisant le plus de RAM:"
    ps aux --sort=-%mem | head -n 2
}

# Fonction pour afficher le processus utilisant le plus de CPU
show_top_cpu() {
    echo "Processus utilisant le plus de CPU:"
    ps aux --sort=-%cpu | head -n 2
}

# Fonction pour arrêter un processus par son PID
kill_process() {
    read -p "Entrez le PID du processus à arrêter: " pid
    kill -9 $pid
    echo "Processus $pid arrêté."
}

# Menu principal
while true; do
    echo "1. Afficher le processus utilisant le plus de RAM"
    echo "2. Afficher le processus utilisant le plus de CPU"
    echo "3. Arrêter un processus"
    echo "4. Quitter"
    read -p "Choisissez une option (1-4): " choice

    case $choice in
        1)
            show_top_ram
            ;;
        2)
            show_top_cpu
            ;;
        3)
            kill_process
            ;;
        4)
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Option invalide. Veuillez choisir une option entre 1 et 4."
            ;;
    esac
done
