#!bin/sh
# INSTALLER/SCRIPT CANNOT BE EDITED NOR DUPLICATED FOR ANY PROJECT.

# COLOR RED (Use if Root User)
clrRED="\033[0;31m"
# CLEAR COLOR
clrCLEAN="\033[0m"
# REQUIRED
reqApps="apache2 apache2 apache2-utils libapache2-mod-php5 php5 php-pear php5-xcache php5-mysql mysql-server mysql-client youtube-dl synergy"

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
sleep 2
echo "PiCAST is installing everything you need..."
echo "-----------------------------------------------"
sleep 5
echo "!!!!!!!!!!!!!!!!!! WARNING !!!!!!!!!!!!!!!!!!!!"
echo "When asked for MySQL Password, use: thePICAST. "
sleep 10
sudo aptitude install -y $reqApps

# UPDATE YOUTUBE-DL (Use for YouTube Audio Downloading)
clear
echo "We need to run an update for getting the latest"
echo "method to get YouTube Stream/Downloading...    "
sleep 3
echo "Follow any prompts that may display....        "
sudo youtube-dl -U


# SETUP MYSQL
clear
echo "We need to setup MySQL, I will help you..."
echo "------------------------------------------"
sleep 2
echo "Type MySQL Password if asked (thePICAST). "
sleep 2
# MAKE DATABASE
sudo mysql -uroot -pthePICAST "CREATE DATABASE picaster;"
sleep 2
echo "Database Created!"
sudo mysql -uroot -pthePICAST "CREATE USER 'picast'@'localhost' IDENTIFIED BY 'piCAST1337';"
echo "User Created!"
sleep 2
sudo mysql -uroot -pthePICAST "GRANT ALL PRIVILEGES ON picast . Items TO 'picast'@'localhost';"
sleep 2
sudo mysql -uroot -pthePICAST "FLUSH PRIVLEGES;"
echo "MySQL setup is Complete!"
sleep 2
# COPY EVERYTHING FOR PICAST
clear # clear the screen
echo "Congratulations! We got everything & Setup is almost Done!"
echo ""
sleep 2
echo "I'm going to download missing parts now..."
echo ""
sleep 2

# WE'LL USE GITHUB TO PROPERLY GRAB LATEST MASTER FILES
git clone https://github.com/lanceseidman/PiCAST.git
sudo mv PiCAST /var/www/ # Let's move it!
sudo rm -rf /var/www/PiCAST/installer.sh # Don't want/need this anymore!
sudo mv /var/www/PiCAST/grabber.sh /home/$USER/picast/grabber.sh
sudo chmod +x /home/$USER/picast/grabber.sh
#sudo rm -rf /var/www/PiCAST/netflix # Remove till this works!
#sudo rm -rf /var/www/PiCAST/music_grooveshark # Remove till this works!
#sudo rename README.md README.txt # Rename for less EU confusion

echo "You can now run PiCAST from the folder picast in your user folder!"
sleep 3
echo "To run the service, simply type: "
echo "watch -n xx sh grabber.sh (replace xx with amount of seconds)."
sleep 4
echo "Good luck!"

fi
