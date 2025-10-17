#!/usr/bin/env bash
#Created By Manfred - 2025.10.16

# Nextcloud AIO von Hand installieren
OPTAIO='/opt/aio-von-hand'

clear
# Hier Abfragen
echo 'In welchem Verzeichnis sollen die Benutzer-Daten gespeichert werden'
echo 'Dort sollte genug Plattenplatz zur Verfügung stehen. Z,.B.:/mnt/ssd'
echo '======================================================================'
read -p 'Das Verzeichnis bitte: ' USRDATA
echo
echo 'Unter welchen Domainnamen soll deine neue Nextclou erreichbar sein?'
echo ======================================================================      
read -p 'Den Domain Namen Bitte: ' NCDOMAIN
echo
echo 'Ein sicher Passwot für admin. Bitte gut kerken'
echo ======================================================================      
read -p 'Das adminPasswort bitte: ' APASSWD
echo
echo 'Wenn Du diesen Wert auf einen anderen Wert als 443 ändern, kannst Du ihn hinter einem Webserver oder Reverse-Proxy ausführen,'
echo 'wie Apache, Nginx, Caddy, Cloudflare. Für einen Proxy verwende ich immer Port 11000'
echo ================================================================================================================================      
read -p 'Den ApachePort bitte: ' APORT

clear
echo Verzeichnisse werden erstellt und Dateien kopiert.
echo ===================================================
echo

sudo mkdir -pv $OPTAIO && sudo chown -v $USER: $OPTAIO 
sudo mkdir -pv $USRDATA  && sudo chown -v $USER: $USRDATA

cp -fv dot.env $OPTAIO/.env
cp -fv compose.yaml $OPTAIO/docker-compose.yaml
sleep 3

echo Datei dot.env vird angepasst 

cat<<editdotenv>>$OPTAIO/.env

# Geändert durch das Instaall Script von Manfred

NC_DOMAIN=$NCDOMAIN
NEXTCLOUD_PASSWORD=$APASSWD # Das Password für admin
APACHE_PORT=$APORT  # Changing this to a different value than 443 will allow you to run it behind a web server or reverse proxy (like Apache, Nginx, Caddy, Cloudflare.
COLLABORA_DICTIONARIES="de_DE en_US"
NEXTCLOUD_DATADIR=$USRDATA # Oder wo gnügend Speinerplatz vorhanden ist
editdotenv
sleep 5

cat<<startcontainer

Starte die nextcloud-aio Container.....

startcontainer

sleep 3

docker compose -f $OPTAIO/docker-compose.yaml up -d

clear

sleep 3

cat<<info

 Der Status kann kontroliert werden mit:
    
     docker stats

info

cat<<dockerstats

Das sollte dann so aussehen.

CONTAINER ID   NAME                                CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS 
532fc3f2d525   nextcloud-aio-apache                0.09%     98.55MiB / 7.568GiB   1.27%     86.9MB / 188MB    40MB / 73.7kB     124 
6bd8f5bb18a9   nextcloud-aio-nextcloud             0.03%     608.8MiB / 7.568GiB   7.86%     479MB / 267MB     1.53GB / 1.81GB   10 
cb4dff3cb66d   nextcloud-aio-docker-socket-proxy   0.00%     14.08MiB / 7.568GiB   0.18%     298kB / 514kB     17.9MB / 0B       6 
26fdb4b0dec7   nextcloud-aio-imaginary             0.00%     136.8MiB / 7.568GiB   1.77%     82MB / 20.8MB     26.6MB / 0B       15 
d401137c6202   nextcloud-aio-redis                 0.19%     8.383MiB / 7.568GiB   0.11%     52.9MB / 30.7MB   3.29MB / 163MB    6 
10deedae1415   nextcloud-aio-database              0.00%     52.5MiB / 7.568GiB    0.68%     89.6MB / 227MB    8.24MB / 557MB    8 
d4a92b074dd1   nextcloud-aio-whiteboard            0.01%     105.9MiB / 7.568GiB   1.37%     4.63MB / 5.48MB   74.1MB / 0B       23 
731081edc807   nextcloud-aio-notify-push           0.00%     4.223MiB / 7.568GiB   0.05%     1.48MB / 1.41MB   3.64MB / 0B       7 
18a8ce1892e9   nextcloud-aio-talk                  0.95%     126.4MiB / 7.568GiB   1.63%     21.4MB / 4.83MB   37.1MB / 0B       69 
e82c67c98614   nextcloud-aio-collabora             0.24%     585.1MiB / 7.568GiB   7.55%     11MB / 8.61MB     102MB / 8.29GB    18 
ea09edaae4d1   nextcloud-aio-jellyfin              0.01%     163.4MiB / 7.568GiB   2.11%     0B / 0B           65.5MB / 2.7MB    18 
88a0e015a481   nextcloud-aio-calcardbackup         0.01%     2.219MiB / 7.568GiB   0.03%     19.5kB / 14.5kB   8.53MB / 16.4kB   3 

      =>  docker stats  <=


dockerstats

cat<<ende

    Login: $NCDOMAIN    
 
     User: admin 
     Passwort: $APASSWD

 
 Na denn... Viel Spaß!


ende
exit 0
