#!/bin/sh
############################################
echo "Welcome to PiCAST 3! \n\n\n"

echo "Performing Aptitude Update... \n"
sudo apt-get update

echo "Performing any upgrades (just in case)... \n"
sudo apt-get upgrade

echo "Ok, lets get to the requirements, bare with me... \n"
sudo apt-get install python-dev python-pip nodejs npm youtube-dl lame mpg321 -y

echo "I'm too lazy to check if all went well, so let's move on... \n"
