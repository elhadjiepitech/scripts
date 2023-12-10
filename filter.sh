#!/bin/bash

# Vérifier si un argument a été fourni
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /home/irelia/Projet-public/echo/dossier.txt"
    exit 1
fi

# Attribuer le chemin du fichier fourni à une variable
file_path=$1

# Vérifier si le fichier existe
if [ ! -f "$file_path" ]; then
    echo "Le fichier spécifié n'existe pas."
    exit 2
fi

# Compter le nombre de lignes dans le fichier
line_count=$(wc -l < "$file_path")
echo "Le nombre de lignes dans le fichier est : $line_count"

# Compter le nombre de fois que le mot "epitech" apparaît dans le fichier
word_count=$(grep -o -i tu "$file_path" | wc -l)
echo "Le mot 'tu' apparaît $word_count fois dans le fichier."

exit 0
