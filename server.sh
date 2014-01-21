#!/bin/sh
############################################
# PiCAST Server/Listener
# ------------------------------------------
# Setup: chmod +x server.sh
# Start Command: sh /server.sh
############################################

########### Start PiCAST Networking ###########
# Pi IP/Port (Optional)
set address "127.0.0.1"
set port "88450"
########### End PiCAST Networking   ###########

# Let's start the process of keeping me ALIVE!
while true
do
 nc -l -p $port

# Port is 2555; Modify for Firewall/Pref.

echo "Welcome to PiCAST!"
echo "------------------"
theIP=`/sbin/ifconfig wlan0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

if [ $theIP != null ]; then
echo "To run, please send requests to IP: " $theIP
echo "+===================================================+"
echo "Example: pic_ytvideo <URL/VIDEO> | nc " $theIP
else
theIP=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
echo "To run, please send requests to IP: " $theIP
echo "+===================================================+"
echo "Example: pic_ytvideo <URL/VIDEO> | nc " $theIP
fi
done
