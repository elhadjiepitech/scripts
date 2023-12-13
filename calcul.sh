#!/usr/bin/bash
echo "echo Permet d'afficher ou 'print' quelques chose"
GREET="Bonjour cher ami!"
echo $GREET


# Demande à l'utilisateur de saisir les deux nombres
echo -n "Entrez le premier nombre : "
read nombre1
echo -n "Entrez le deuxième nombre : "
read nombre2

# Demande à l'utilisateur de choisir l'opération
echo -n "Choisissez l'opération à effectuer (+, -, *, /) : "
read operation

# Vérifie l'opération choisie et effectue le calcul correspondant
if [ "$operation" = "+" ]; then
    resultat=$(expr $nombre1 + $nombre2)
elif [ "$operation" = "-" ]; then
    resultat=$(expr $nombre1 - $nombre2)
elif [ "$operation" = "*" ]; then
    resultat=$(expr $nombre1 \* $nombre2)
elif [ "$operation" = "/" ]; then
    resultat=$(expr $nombre1 / $nombre2)
else
    echo "Opération invalide !"
    exit 1
fi

# Affiche le résultat
echo "Le résultat est : $resultat"


