#!/bin/sh
############################################
echo "Welcome to PiCAST 3! \n\n\n"

echo "Performing Aptitude Update... \n"
sudo apt-get update

echo "Performing any upgrades (just in case)... \n"
sudo apt-get upgrade

echo "Ok, lets get to the requirements, bare with me... \n"
sudo apt-get install python-dev python-pip nodejs npm youtube-dl lame mpg321 mplayer livestreamer x2x git -y

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
pause 1
echo "\n Understand, this would be a good time for coffee or tea... Going to be awhile!"
pause 2

# Process for FFMPEG...
cd /usr/src # We could have done cd.. but we're taking NO CHANCES...
sudo git clone git://source.ffmpeg.org/ffmpeg.git
cd ffmpeg
sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree
sudo make
sudo make install
