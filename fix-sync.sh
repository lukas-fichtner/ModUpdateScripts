#!/bin/bash
#Mod Progress  v0.2.6
#Script by Xedon 07.04.2017
#last update 20.05.2019

#Permissions
chown -R launcherusync:www-data /home/webstorage/dwcentral/UnityLife/
chmod -R 775 /home/webstorage/dwcentral/UnityLife/

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