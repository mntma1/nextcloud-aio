# Nextcloud AIO von Hand installieren

**Dateien kopieren**
```
sudo mkdir /opt/nextcloud-aio && sudo chown $USER: /opt/nextcloud-aio 
sudo mkdir /mnt/ncaio-userData  && sudo chown $USER: /mnt/ncaio-userData

cp dot.env  /opt/nextcloud-aio/.env
cp compose.yaml /opt/nextcloud-aio/docker-compose.yaml

cd /opt/nextcloud-aio
```

**Datei .env anpassen**

>[!WARNING]
> Unbedingt anpassen

**Zeilen hinzufügen**

**nano .env**
```
NC_DOMAIN=deine.domain.de
NEXTCLOUD_PASSWORD=EinSichersPasswort # Das Password für admin
APACHE_PORT=11000  # Changing this to a different value than 443 will allow you to run it behind a web server or reverse proxy (like Apache, Nginx, Caddy, Cloudflare Tunnel and else).
COLLABORA_DICTIONARIES="de_DE en_US"
NEXTCLOUD_DATADIR=/mnt/ncaio-userData # Oder wo gnügend Speinerplatz vorhanden ist
```

**Container erstellen**
```
docker compose up -d
```

**Der Status kann kontroliert werden mit:**

**docker stats**
```
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
88079ad331b4   nextcloud-aio-mastercontainer       0.50%     92.47MiB / 7.568GiB   1.19%     1.12MB / 2.33MB   80.6MB / 3.01MB   149 
6a3e16cb888b   immich_server                       0.26%     401.7MiB / 7.568GiB   5.18%     448MB / 1.26GB    256MB / 71.5MB    24 
149e18dd2783   immich_machine_learning             0.17%     250.6MiB / 7.568GiB   3.23%     11.1MB / 10MB     23.8MB / 24.6kB   11 
b32209a30ca3   immich_postgres                     0.00%     121.3MiB / 7.568GiB   1.57%     4.35MB / 210MB    116MB / 1.19GB    10 
9626d3955594   immich_redis                        0.32%     7.648MiB / 7.568GiB   0.10%     965MB / 225MB     7.58MB / 9.69MB   5 
```

## Login: deine.domain.de
**admin / DasSichrePasswort**
# Na denn -> Viel Spaß!


