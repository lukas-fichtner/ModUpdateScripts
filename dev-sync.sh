#!/bin/bash
#Mod Progress  v0.2.5
#Script by Xedon 07.04.2017
#last update 25.11.2018

#Permissions
chown -R launcherusync:www-data /home/webstorage/dwcentral/UnityLife/
chmod -R 775 /home/webstorage/dwcentral/UnityLife/

#Run A3sync
echo [ArmaSync Hash DEV Folder]
cd /opt/sync
java -jar ArmA3Sync.jar -BUILD Unity-LifeDEV

#END
echo [DONE]

#zeige Datenträger
echo [INFO] Speicherplatz / Datenträger:
df -h
