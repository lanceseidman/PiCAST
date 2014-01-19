!#/bin/bash
###########################################
#					  #
#       PiCAST 2.0 Installer (base)       #
#					  #
#         Written by: Lance Seidman	  #
#					  #
###########################################

# Let's Create some Variables...
reqApps="netcat youtube-dl mplayer"
echo "############################################"
echo "# WELCOME TO PICAST 2.0 Installer/Setup!   #"
echo "#------------------------------------------#"
echo "# Without further ado, let's get started...#"
echo "############################################"

# Is the user logged in as root? Hope not!
if [ $(whoami) = "root" ]
then
echo "It's not recommended you run this as root. Are you sure you want to?"
echo "Type 'Y'es or 'N'o:"
read response

# Let's see what the user response is...
if [ "$response" = "n" ]; then
exit
else
if [ "$response" = "y"]; then
echo "You've been warned!"
fi

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

# GitHub Download/Setup/Install
echo "Going to download the latest PiCAST files..."
git clone https://github.com/lanceseidman/PiCAST.git
echo "Received GIT File..."
clear
echo "###############################################"
echo "#    	    PiCAST User Select		    #"
echo "# Please choose a user to install PiCAST to.  #"
echo "#---------------------------------------------#"
users 
echo "###############################################"
echo "Which user should I setup to: " read usresp

# Let's make sure it isn't a blank response.
if [ "$usresp" = "" ]; then
echo "You must select a user: " read usresp
 if ["$usresp" = "" ]; then
echo "OK, Fine... Goodbye!"
exit
fi
else
# Let's store the path
usrPATH="/home/$usresp"

echo "Starting to transfer files..."
sudo mv PiCAST $usrPATH/
echo "... File's transfered to $usrPATH"
sudo chmod +x $usrPATH/PiCAST/youtube/yt-midori.sh
echo "... Midori Chmodded!"
sudo chmod +x $usrPATH/PiCAST/youtube/yt-musicgrab.sh
echo "... YouTube Music Chmodded!"
sudo chmod +x $usrPATH/PiCAST/youtube/yt-videograb.sh
echo "... YouTube Video Chmodded!"
sudo chmod +x $usrPATH/PiCAST/browser/brow-midori.sh
echo "... Midori Browser Chmodded!"

echo "Completed Git File Download, Transfer, Chmod..."
pause 2
echo "Setting up Aliases..."
echo "alias pic_ytvid='sh $usrPATH/PiCAST/youtube/yt-videograb.sh'" >> sudo /etc/bash.bashrc
echo "alias pic_ytmusic='sh $usrPATH/PiCAST/youtube/yt-musicgrab.sh'" >> sudo /etc/bash.bashrc
echo "alias pic_brow-midori='sh $usrPATH/PiCAST/browser/brow-mirori.sh'" >> sudo /etc/bash.bashrc
echo "... Aliases Done."
pause 2
echo "Setup looks to be done, even though we had so much fun!"
echo "......................................................."
echo "To start the PiCAST Server, simply type: pic-server."
echo ""
echo "                    Have a nice day!"
exit
