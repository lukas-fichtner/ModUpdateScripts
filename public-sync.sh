#!/bin/bash
#Mod Progress  v0.2.6
#Script by Xedon 07.04.2017
#last update 20.05.2019

echo [starte mod update]

#Permissions
chown -R launcherusync:www-data /home/webstorage/dwcentral/ParadiseRPG/
chmod -R 775 /home/webstorage/dwcentral/ParadiseRPG/

#Run Hash-Script for Mod Update
echo [update CC Hashlist]
cd /home/Sync/scripts/
sudo python hash.py /home/webstorage/dwcentral/ParadiseRPG/public/modpack/@Paradise-RPG/ hashlist.json

#delete old updatehashlist
rm /home/webstorage/dwcentral/ParadiseRPG/files/hashlist.json

#move updatehashlist to webserver
chown www-data:www-data hashlist.json
mv hashlist.json /home/webstorage/dwcentral/ParadiseRPG/files/

#lösche alten CloudFlare Cache
echo [lösche alten CloudFlare Cache]
curl -X POST "https://api.cloudflare.com/client/v4/zones/a69d6dcd39e3d546b7702763c97e017c/purge_cache" \
     -H "X-Auth-Email: quitscope@outlook.de" \
     -H "X-Auth-Key: e2a14fddc00d0e5741221f5694db32f369239" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
echo [alter CloudFlare Cache wurde gelöscht]

#END
echo [DONE]

#zeige Datenträger
echo [INFO] Speicherplatz / Datenträger:
df -h
