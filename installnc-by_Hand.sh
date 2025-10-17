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
echo 'Wenn Du diesen Wert auf einen anderen Wert als 443 ändern,' 
echo 'kannst Du ihn hinter einem Webserver oder Reverse-Proxy ausführen,'
echo 'wie Apache, Nginx, Caddy, Cloudflare. Für einen Proxy verwende ich immer Port 11000'
echo =======================================================================================      
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

echo
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



cat<<info
    
   Bitte .....Warten      

info

sleep 5

docker stats --no-stream

cat<<ende

    Login: $NCDOMAIN    
 
     User: admin 
     Passwort: $APASSWD

 
 Na denn... Viel Spaß!


ende
exit 0
