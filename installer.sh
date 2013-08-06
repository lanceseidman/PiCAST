#!/bin/sh

##############################################################################
#                   PiCAST Install & Config Helper                           #
#                                                                            #
# Auto-Installer for PiCAST to make PiCAST easy for everyone to use...       #
#                                                                            #
# NEW PI? FIRST RUN: sudo apt-get update. Run this command before Installer! #
#                                                                            #
# Useage:                                                                    #
# sudo sh installer.sh                                                       #
#                                                                            #
##############################################################################

# STORING VARIABLES...
# COLOR RED (Use if Root User)
clrRED="\033[0;31m"
# CLEAR COLOR ASSIGNMENTS
clrCLEAN="\033[0m"

# START CHECK OF ROOT LOGIN (NOT COMPLETED)
#if [[ $users == root]]; then
#echo $clrRED"PiCAST Error: Can't be root during setup!"$clrCLEAN
#exit 0
#fi

# NON-ROOT LOGIN; PROCEED SETUP
echo "Cleaning old APT Cache..."
aptitude clean

echo "Removing old Configs & Emptying Trash"
sudo aptitude purge $OLDCONF
#/
#if [[ $dpkg-query -f --show <pkg> 2>/dev/null == <pkg>]]; then
#echo "exists!"
#fi

