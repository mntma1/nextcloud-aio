# Install Nextcloud AIO
 
1. Installere **Docker** 
```
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
```
2. Füge dich zur Gruppe **docker** hinzu
 
```
sudo usermod -aG docker $USER
```
3. Drücker **[STRG]+D**, dann melde dich neu an.
 
4. Lade das Ropository **nextcloud-aio** herunter
 
```
git clone https://github.com/mntma1/nextcloud-aio.git
```
 
5. cd nextcloud-aio und feuere das Script ab.

```
chmod +x install_nc-aio && ./install_nc-aio.sh
```
> [!NOTE]
> Gebe das Verzeichnis an, in welchem die Benutzerdaten gespeichert werden sollen.

> [!WARNING]
> Kein "/" am Ende!
>> Zum Beispiel: /mnt/ssd
 
6. Öffne im Browser das Nextcloud-AIO Setup => https://IP:8080

![3bfbcc5093f69c42566a3b3707ff48e8](https://github.com/user-attachments/assets/315eae5f-495d-46dd-a9f5-451b5069e270)




