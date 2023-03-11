#!/bin/bash
#Mod Progress  v0.2.8
#Script by Xedon 07.04.2017
#last update 02.06.2019

#Run A3sync
echo [starte Arma Sync hash]
cd /opt/sync

#update PUB
echo [starte Public Sync hash]
sudo java -jar ArmA3Sync.jar -BUILD ParadiseRPG-PUB

#Permissions
sudo chown -R launcherusync:www-data /home/webstorage/dwcentral/ParadiseRPG/
sudo chmod -R 775 /home/webstorage/dwcentral/ParadiseRPG/

#lösche alten CloudFlare Cache
echo [lösche alten CloudFlare Cache]
curl -X POST "https://api.cloudflare.com/client/v4/zones/<enter-your-zone-id-here>/purge_cache" \
     -H "X-Auth-Email: <enter-your-email-here>" \
     -H "X-Auth-Key: <enter-your-key-here>" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
echo [alter CloudFlare Cache wurde gelöscht]

#END
echo [DONE]
