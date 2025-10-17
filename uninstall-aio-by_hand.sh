#!/usr/bin/env bash

# Verzeichnisse löschen
clear
cat<<anfang

    Deinstalliere nun nextcloud-aio. 

    .....Warten

anfang
sleep 3

docker compose -f /opt/aio-von-hand/docker-compose.yaml down

echo 'Das Benutzer-Passwor eingeben. Abbruch mit ^C'
sudo rm -rfv /opt/aio-von-hand
sudo rm -rfv /home/aio_byHand-usrData/
clear
cat<<rmcontainer

 Images löschen

rmcontainer
sleep 3

docker image rm ghcr.io/nextcloud-releases/aio-nextcloud
docker image rm ghcr.io/nextcloud-releases/aio-postgresql
docker image rm ghcr.io/nextcloud-releases/aio-apache
docker image rm ghcr.io/nextcloud-releases/aio-redis
docker image rm ghcr.io/nextcloud-releases/aio-notify-push

cat<<rmvolumes

 Volumes löschen

rmvolumes
docker volume rm  nextcloud_aio_apache
docker volume rm  nextcloud_aio_database
docker volume rm  nextcloud_aio_database_dump
docker volume rm  nextcloud_aio_nextcloud
docker volume rm  nextcloud_aio_redis

cat<<ende

     ........Fertig

ende
exit 0
