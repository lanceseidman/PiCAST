#!/bin/sh
#########################################################################
#                                                                       #
# THIS IS THE GRABBER. THIS WILL GRAB THE WEB PHP FILE AND RUN THE      #
# COMMANDS WE SEND TO THE PI VIA API...                                 #
#                                                                       #
#########################################################################

#content=$(wget http://localhost/grabCAST.php -q -0 -)
# We're going to try cURL for awhile...
content=$(curl -L http://localhost/PiCAST/grabCAST.php)
for WORKS in "$content"
do
command $WORKS
done
