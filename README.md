# Install Nextcloud AIO
 
1. Installere **Docker** 
```
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
```
2. Füge dich der Gruppe **docker** hinzu
 
```
sudo usermod -aG docker $USER
```
3. Drücker **[STRG]+D** und dann öffne ein neues Termianl
 
4. Lade das Ropository **nextcloud-aio** herunter
 
```
git clone https://github.com/mntma1/nextcloud-aio.git
```
 
5. cd nextcloud-aio und feuere das Script ab.
 
```
chmod +x install_nc-aio && ./install_nc-aio.sh
```
 
6. Now goto: [Setup Nextcloud AIO](https://192.168.17.55:8080)
7. Now goto: Setup Nextcloud AIO -> https://192.168.xxx.xxx:8080

![3bfbcc5093f69c42566a3b3707ff48e8](https://github.com/user-attachments/assets/315eae5f-495d-46dd-a9f5-451b5069e270)


 
### File: install_nc-aio.sh
```
#!/usr/bin/bash
sudo mkdir /ncdata # Or an mountpoint to an external data carrier
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
--env SKIP_DOMAIN_VALIDATION=false \
--env NEXTCLOUD_DATADIR="/ncdata" \ # Directory or mountpoint
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
ghcr.io/nextcloud-releases/all-in-one:latest

cat<<ende
 
Öffne nun im Browser: 

    https://$(hostname -I | awk '{print $1}' | cut -d/ -f1):8080

auf.
ende
exit 0
```

