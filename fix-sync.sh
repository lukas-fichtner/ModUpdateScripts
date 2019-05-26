#!/bin/bash
#Mod Progress  v0.2.7
#Script by Xedon 07.04.2017
#last update 26.05.2019

#Permissions
sudo chown -R launcherusync:www-data /home/webstorage/dwcentral/ParadiseRPG/
sudo chmod -R 775 /home/webstorage/dwcentral/ParadiseRPG/

#lösche alten CloudFlare Cache
echo [lösche alten CloudFlare Cache]
curl -X POST "https://api.cloudflare.com/client/v4/zones/dca3906acf2be1536920febdc174b235/purge_cache" \
     -H "X-Auth-Email: quitscope@outlook.de" \
     -H "X-Auth-Key: e2a14fddc00d0e5741221f5694db32f369239" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'
echo [alter CloudFlare Cache wurde gelöscht]

#END
echo [DONE]
