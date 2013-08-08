#!bin/sh
# INSTALLER/SCRIPT CANNOT BE EDITED NOR DUPLICATED FOR ANY PROJECT.

# COLOR RED (Use if Root User)
clrRED="\033[0;31m"
# CLEAR COLOR
clrCLEAN="\033[0m"
# REQUIRED
reqApps="apache2 apache2 apache2-utils libapache2-mod-php5 php5 php-pear php5-xcache php5-mysql mysql-server mysql-client gnash synergy"

# START CHECK OF ROOT LOGIN (NO COMPLETED)
if [ $(whoami) = "root" ]
then
echo $clrRED"Sorry, please run as Pi or non-root account!"$clrCLEAN
exit 1
else
# NON-ROOT LOGIN; PROCEED SETUP
clear # Let's clear the Window!
echo "############################################"
echo "#       WELCOME TO PICAST AUTO-SETUP!      #"
echo "#               by Lance Seidman           #"
echo "#------------------------------------------#"
echo "# I'm here to perform some tasks, so try   #"
echo "# to hold on a few moments... I'll let you #"
echo "# know what's going on as I do them...     #"
echo "#------------------------------------------#"
echo "# Without further ado, let's get started!  #"
echo "#            Hang tight... Or LOOSE!       #"
echo "############################################"
echo ""
echo "          I'm going to start now...."
echo ""
echo "Cleaning old APT Cache..."
sudo aptitude clean

echo "Removing old Configs..."
sudo aptitude purge $OLDCONF

# START APP INSTALL
echo "Go Play! Go Watch TV/YouTube, just don't touch!"
echo "PiCAST is installing everything you need..."
sudo aptitude install -y $reqApps

# SETUP MYSQL
clear
echo "We need to setup MySQL, I will help you..."
echo "------------------------------------------"
echo "Please type the MySQL Password (Hint: thePICAST)"
# MAKE DATABASE
sudo mysql -uroot -pthePICAST "CREATE USER 'picast'@'localhost' IDENTIFIED BY 'piCAST1337';"
sudo mysql -uroot -pthePICAST "CREATE DATABASE picaster;"
sudo mysql -uroot -pthePICAST "GRANT ALL PRIVILEGES ON picast . Items TO 'picast'@'localhost';"
sudo mysql -uroot -pthePICAST "FLUSH PRIVLEGES;"

# COPY EVERYTHING FOR PICAST
clear # clear the screen
echo "Congratulations! WE got everything & Setup is almost Done!"
echo ""
echo "I'm going to download missing parts now..."
echo ""

# WE'LL USE GITHUB TO PROPERLY GRAB LATEST MASTER FILES
git clone https://github.com/lanceseidman/PiCAST.git
sudo mv PiCAST /var/www/ # Let's move it!
sudo rm -rf /var/www/PiCAST/installer.sh # Don't want/need this anymore!
sudo rm -rf /var/www/PiCAST/netflix # Remove till this works!
sudo rm -rf /var/www/PiCAST/music_grooveshark # Remove till this works!
#sudo rename README.md README.txt # Rename for less EU confusion

fi
