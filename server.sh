#!/bin/sh
############################################
# PiCAST Server/Listener
# ------------------------------------------
# Setup: chmod +x server.sh
# Start Command: sh /server.sh
############################################

########### Start PiCAST Networking ###########
# Pi IP/Port (Optional)
set address "127.0.0.1" # soon...
set port "88450" # soon...
########### End PiCAST Networking   ###########

#echo "Reading Config File for Settings..."
#source $path/con.cfg

# Let's start the process of keeping me ALIVE!
while true
do

echo "Welcome to PiCAST!"
echo "------------------"
theIP=`/sbin/ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

if [ $theIP != null ]; then
echo "To CAST, please send requests to IP: " $theIP
echo "+===================================================+"
echo "Example: pic_ytvideo <URL/VIDEO> | picast-go $theIP -k picast"
else
theIP=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
echo "To CAST, please send requests to IP: " $theIP
echo "+===================================================+"
echo "Example: pic_ytvideo <URL/VIDEO> | picast-go $theIP -k picast"
fi

# We're going to use the pre-defined settings above, change as needed.
cryptcat -l -p 8882 -k picast #$pass coming soon

done
