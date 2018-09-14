#!/bin/bash
#Mod Progress  v0.2
#Script by Xedon 07.04.2017
#last update 30.06.2018

#update dev folder
echo [starte mod update]
echo [sync public ordner mit dev ordner]
rm -r /home/webstorage/dwcentral/UnityLife/public/modpack/@Unity_Life
cp -r /home/webstorage/dwcentral/UnityLife/dev/modpack/@Unity_Life /home/webstorage/dwcentral/UnityLife/public/modpack

#Permissions
chown -R launcherusync:www-data /home/webstorage/dwcentral/UnityLife/
chmod -R 775 /home/webstorage/dwcentral/UnityLife/
chmod -R 775 /home/webstorage/dwcentral/ParadiseLife/
chown -R launcherusync:www-data /home/webstorage/dwcentral/ParadiseLife/

#Run Hash-Script for Mod Update
echo [update CC Hashlist]
cd /home/Sync/scripts/
sudo python hash.py /home/webstorage/dwcentral/UnityLife/public/modpack/@Unity_Life/ hashlist.json

#delete old updatehashlist
rm /home/webstorage/dwcentral/ParadiseLife/files/hashlist.json

#move updatehashlist to webserver
chown unitylife:www-data hashlist.json
mv hashlist.json /home/webstorage/dwcentral/ParadiseLife/files/

#Run A3sync
echo [starte Arma Sync hash]
cd /home/Sync
#update PUB
echo [starte Public Sync hash]
java -jar ArmA3Sync.jar -BUILD Unity-LifePUB

#END
echo [DONE]

#zeige Datenträger
echo [INFO] Speicherplatz / Datenträger:
df -h
