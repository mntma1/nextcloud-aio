# Nextloud AIO von Hand installieren

## Dateien kopieren
```
sudo mkdir /opt/nextcloud-aio && sudo chown $USER: /opt/nextcloud-aio 
sudo mkdir /mnt/ncaio-userData  && sudo chown $USER: /mnt/ncaio-userData

cp dot.env  /opt/nextcloud-aio/.env
cp compose.yaml /opt/nextcloud-aio/docker-compose.yaml

cd /opt/nextcloud-aio
```

## Datei .env anpassen

>[!WARNING]
> Unbedingt anpassen

## nano .env
```
NC_DOMAIN=deine.domain.de
NEXTCLOUD_PASSWORD=EinSichersPasswort # Das Password für admin
APACHE_PORT=11000  # Changing this to a different value than 443 will allow you to run it behind a web server or reverse proxy (like Apache, Nginx, Caddy, Cloudflare Tunnel and else).
COLLABORA_DICTIONARIES="de_DE en_US"
NEXTCLOUD_DATADIR=/mnt/ncaio-userData # Oder wo gnügend Speinerplatz vorhanden ist
```

## Container erstellen
```
docker compose up -d
```

# der Status kann kontroliert werden mit:
```
docker stats
```

## Login: deine.domain.de 
#### admin / DasSichrePasswort

# Na denn -> Viel Spaß! 
