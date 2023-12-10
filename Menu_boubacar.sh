  GNU nano 5.4                                                                                                      script2.sh                                                                                                                
#!/bin/bash

# Fonction pour vérifier si un utilisateur existe
check_user_exists() {
  read -p "Entrez le nom de l'utilisateur à vérifier : " username
  if id "$username" &>/dev/null; then
    echo "L'utilisateur '$username' existe."
  else
    echo "L'utilisateur '$username' n'existe pas."
  fi
}

# Fonction pour retourner l'UID d'un utilisateur
get_user_uid() {
  read -p "Entrez le nom de l'utilisateur pour obtenir l'UID : " username
  if id "$username" &>/dev/null; then
    uid=$(id -u "$username")
    echo "L'UID de l'utilisateur '$username' est : $uid"
  else
    echo "L'utilisateur '$username' n'existe pas."
  fi
}

# Boucle principale du menu
while true; do
  echo "MENU:"
  echo "1. Vérifier l'existence d'un utilisateur"
  echo "2. Vérifier l'UID d'un utilisateur"
  echo "q. Quitter"
  read -p "Choisissez une option : " option

  case $option in
    1)
      check_user_exists
      ;;
    2)
      get_user_uid
      ;;
    q)
      echo "Sortie du programme."
      break
      ;;
    *)
      echo "Option invalide. Veuillez choisir 1, 2 ou q."
      ;;
  esac
done

