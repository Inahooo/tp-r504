#!/bin/bash

# === Variables ===
QUEUE_NAME="queue"
BURST_SIZE=1000
BURST_DELAY=3  # secondes
REDIS_CLI="redis-cli"

# === Vérification de la connexion Redis ===
$REDIS_CLI DBSIZE >/dev/null
if ! [ $? = 0 ]; then
  echo "Erreur, pas de connection avec le serveur redis!"
  exit 1
fi

while :
do
  echo "Envoi d’un burst de $BURST_SIZE valeurs..."
  for ((i=0; i<BURST_SIZE; i++)); do
    $REDIS_CLI LPUSH "$QUEUE_NAME" $RANDOM >/dev/null
  done

  # Afficher la taille actuelle de la file
  TAILLE=$($REDIS_CLI LLEN "$QUEUE_NAME")
  echo "Taille actuelle de la file : $TAILLE"

  # Pause entre les bursts
  sleep "$BURST_DELAY"
done

