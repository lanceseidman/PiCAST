#!/bin/sh
############################################
echo "Welcome to PiCAST 3! \n\n\n"

echo "Performing Aptitude Update... \n"
sudo apt-get update

echo "Performing any upgrades (just in case)... \n"
sudo apt-get upgrade

echo "Ok, lets get to the requirements, bare with me... \n"
sudo apt-get install python-dev python-pip nodejs npm youtube-dl lame mpg321 mplayer livestreamer git -y

echo "I'm too lazy to check if all went well, so lets move on..."
sleep 2
clear # wipe everything away...
echo "I'm going to install H264 Support now, this WILL take some time!!!"
sleep 3

# We need to get H264 Support & FFMPEG on the system... Repo won't have it...

# H264 Process...
cd /usr/src
sudo git clone git://git.videolan.org/x264
cd x264
sudo ./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
sudo make
sudo make install

echo "\n \n I am now going to grab a copy of FFMPEG for MP3 & other reasons..."
sleep 1
echo "\n Understand, this would be a good time for coffee or tea... Going to be awhile!"
sleep 2

# Process for FFMPEG...
cd /usr/src # We could have done cd.. but we're taking NO CHANCES...
sudo git clone git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree
sudo make
sudo make install

# DOWNLOAD/INSTALL FOREVER TO KEEP PICAST RUNNING FOREVER... HAHA?
sudo npm install forever -g
sudo npm install forever-monitor -g

# GET PICAST NEEDED FILES...
cd ~
echo "Making PiCAST Folder..."
mkdir PiCAST
echo "Entering PiCAST Folder..."
cd PiCAST

echo "Getting PiCAST Server file..."
sleep 1
wget https://raw.githubusercontent.com/lanceseidman/PiCAST/master/picast.js
echo "Getting Start/Stop Server files..."
sleep 1
wget https://raw.githubusercontent.com/lanceseidman/PiCAST/master/picast_start.sh
wget https://raw.githubusercontent.com/lanceseidman/PiCAST/master/picast_stop.sh

# INSTALL PICAST DAEMON
read -p "Do you want to start PiCAST automatically on system boot? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cd /etc/init.d
  echo "Getting PiCAST Daemon file..."
  sleep 1
  wget https://raw.githubusercontent.com/lanceseidman/PiCAST/master/picast_daemon
  mv picast_daemon picast
  sudo chown root:root picast
  sudo chmod +x picast
  sudo update-rc.d picast defaults
  cd ~
fi

# RUN PICAST FOR THE FIRST TIME...
chmod +x picast_start.sh
chmod +x picast_stop.sh

echo "Goodbye from PiCAST3 Installer! In the future, run PiCAST3 from picast_start.sh..."
sleep 2
echo "Remember, build upon PiCAST3 & make donations to lance@compulsivetech.biz via PayPal & Help Donate to Opportunity Village."
sleep 3
echo "Launching PiCAST3 for the first time..."
sh picast_start.sh
