#!/bin/sh
###########################################
#					  #
#       PiCAST 2.0 Installer (base)       #
#					  #
#         Written by: Lance Seidman	  #
#					  #
###########################################
 
# Let's Create some Variables...
reqApps="git tee cryptcat youtube-dl mplayer"

### DEV. NOTE ######################################
# I am using cryptcat and not NC for a little extra
# protection. By default PiCAST will use -k picast
# but you should definitely change it & the Port in
# which is being used by default. 
#
# I hope you guys will be using PiCAST all the time.
# so, a little more security hopefully will give a 
# tiny bit of encouragement to continue using or try
# to support the project.
#
### WHO CARES ABOUT SEMI-SECURITY? ##################
# I hope YOU. I got a lot of crap on my last release
# that zero protection existed. So this time, just 
# using the basics of encryption connections & a
# password being used should calm some of you down.
#
# In this day and time, any security is good. I
# wish I could add more but I want this 2.x release 
# out to the public. Hopefully those who have an issue
# will NOT complain but be the answer. Your words have
# no meaning without actions.
#######################################################

echo "############################################"
echo "# WELCOME TO PICAST 2.0 Installer/Setup!   #"
echo "#------------------------------------------#"
echo "# Without further ado, let's get started...#"
echo "############################################"

# Removed Root Detection. Some installs require SUDO.


# Let's make sure our APT is updated...
echo "To be safe, let's remove old APT Cache/Configs (password required for sudo)..."
sudo aptitude clean
echo "Cleaning done..."
sudo aptitude purge $OLDCONF
echo "Removed configs..."
echo ".................."
echo "Let's do a quick update..."
sudo aptitude update
echo "Done updating APT..."
 
# Go Request/Install Required Items...
echo "Requesting required items..."
sudo aptitude install -y $reqApps
echo "Done grabbing required items..."
echo "Preparing YouTube Update (prompts may display, follow them)..."
sudo youtube-dl -U
echo "Done updating YouTube..."

echo "###############################################"
echo "#    	    PiCAST User Select                  #"
echo "# Please choose a user to install PiCAST to.  #"
echo "#---------------------------------------------#"
users 
echo "###############################################"
echo "Which user should I setup to: "
read usresp

# Let's make sure it isn't a blank response.
if [ "$usresp" = "" ]; then
echo "You must select a user: "
read usresp
 
 if [ "$usresp" = "" ]; then
  echo "OK, Fine... Goodbye!"
  exit
 fi
fi

# Let's store the path
usrPATH="/home/$usresp"

# GitHub Download/Setup/Install
echo "Going to download the latest PiCAST files..."
git clone https://github.com/lanceseidman/PiCAST.git
echo "Received GIT File..."
echo "Starting to transfer files..."
sudo mv PiCAST $usrPATH
echo "... File's transfered to $usrPATH"

sudo chmod +x $usrPATH/PiCAST/youtube/yt-midori.sh
echo "... Midori Chmodded!"
sudo chmod +x $usrPATH/PiCAST/youtube/yt-musicgrab.sh
echo "... YouTube Music Chmodded!"
sudo chmod +x $usrPATH/PiCAST/youtube/yt-videograb.sh
echo "... YouTube Video Chmodded!"
sudo chmod +x $usrPATH/PiCAST/browser/brow-midori.sh
echo "... Midori Browser Chmodded!"
sudo chmod +x $usrPATH/PiCAST/server.sh
echo "... PiCAST Server Chmodded!"

echo "Completed Git File Download, Transfer, Chmod..."

echo "Setting up Aliases..."
echo "alias pic_ytvid='sh $usrPATH/PiCAST/youtube/yt-videograb.sh'" | sudo tee -a ~/.bashrc
echo "alias pic_ytmusic='sh $usrPATH/PiCAST/youtube/yt-musicgrab.sh'" | sudo tee -a ~/.bashrc
echo "alias pic_brow-midori='sh $usrPATH/PiCAST/browser/brow-midori.sh'" | sudo tee -a ~/.bashrc
echo "alias picast='sh $usrPATH/PiCAST/server.sh'" | sudo tee -a ~/.bashrc
echo "alias picast-config='pico $usrPATH/PiCAST/con.cfg'" | sudo tee -a ~/.bashrc
source ~/.bashrc # used to refresh our settings for alises...
echo "... Aliases Done."

clear
echo "Lets create a secure password for remote PiCAST requests..."
echo "Type a password (if you forget, type picast-config):"
read picresp

if [ "$picresp" = "" ]; then
echo "YOU MUST TYPE IN A PASSWORD, OTHERWISE I WILL BREAK THE INSTALL!"
echo "Type a password: "
read picresp

  if [ "$picresp" = "" ]; then
   echo "Removing your PiCAST Install now... I warned you!"
   rm -rf $usrPATH/PiCAST
   echo "PiCAST Deleted. Have a horrible day! ;)"
   exit
  fi
fi

# Let's save the config file. You could do . ~/.con.cfg
cat >$usrPATH/PiCAST/con.cfg <<EOL
$picresp
$usrPATH/PiCAST
EOL
chmod 666 $usrPATH/PiCAST/con.cfg
echo "Config File Chmod to 666..."

echo "Deleting Installer"
rm $usrPATH/PiCAST/installer.sh

echo "Setup looks to be done, even though we had so much fun!"
echo "......................................................."
echo "To start the PiCAST Server, simply type: picast."
echo "-------------------------------------------------------"
echo "To define a specific listen IP or Port, edit server.sh."
echo ""
echo "If you have any issues? I'm on Twitter: @LanceSeidman"
echo "                    Have a nice day!"
exit
