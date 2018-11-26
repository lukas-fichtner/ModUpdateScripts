#!/bin/bash
#Mod Progress  v0.2.5
#Script by Xedon 07.04.2017
#last update 25.11.2018

#update dev folder
echo [starte mod update]
echo [sync dev ordner mit public ordner]
rm -r /home/webstorage/dwcentral/UnityLife/dev/modpack/@Unity_Life
cp -r /home/webstorage/dwcentral/UnityLife/public/modpack/@Unity_Life /home/webstorage/dwcentral/UnityLife/dev/modpack

#Permissions
chown -R launcherusync:www-data /home/webstorage/dwcentral/UnityLife/
chmod -R 775 /home/webstorage/dwcentral/UnityLife/

#Run A3sync
echo [starte Arma Sync hash]
cd /opt/sync 

#update PUB
echo [starte Public Sync hash]
java -jar ArmA3Sync.jar -BUILD Unity-LifePUB

#update DEV
echo [starte DEV Sync hash]
java -jar ArmA3Sync.jar -BUILD Unity-LifeDEV

#lösche alten CloudFlare Cache
echo [lösche alten CloudFlare Cache]
curl -X POST "https://api.cloudflare.com/client/v4/zones/733a8f8dc1cf4a08b4f085b60a74977c/purge_cache" \
     -H "X-Auth-Email: stephan@imglol.de" \
     -H "X-Auth-Key: 1b0eee5b2b03e9c34e127f61d16f30169e529" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
echo [alter CloudFlare Cache wurde gelöscht]

#END
echo [DONE]

#zeige Datenträger
echo [INFO] Speicherplatz / Datenträger:
df -h
