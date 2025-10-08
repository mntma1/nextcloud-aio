#!/usr/bin/env bash
# Created by Manfred - 22.08.2025 16:23 Uhr
echo 'Wo sollen die Benuzer-Dateien gespeichert werden(Da sollte genug Plattenplatz verfügbar sein)?'
echo '(Mountpoint zu einer Partition oder einer SSD)'
read -p 'Das Verzeichnis für die Benutze-Dateien bitte: ' UDIR 

sudo mkdir -p $UDIR; sudo chown $USER: $UDIR;
docker volume create nextcloud_aio_nextcloud_data
docker run \
--init \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 8080:8080 \
--env APACHE_PORT=11000 \
--env APACHE_IP_BINDING=0.0.0.0 \
--env APACHE_ADDITIONAL_NETWORK="" \
--env NEXTCLOUD_DATADIR="$UDIR" \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
ghcr.io/nextcloud-releases/all-in-one:latest
exit 0
