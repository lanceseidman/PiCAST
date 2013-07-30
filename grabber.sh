#!/bin/sh
#########################################################################
#                                                                       #
# THIS IS THE GRABBER. THIS WILL GRAB THE WEB FILE GOIN.PHP AND RUN THE #
# COMMANDS WE SEND TO THE PI VIA API...                                 #
#                                                                       #
#########################################################################

content=$(wget http://localhost/goin.php -q -0 -)
for WORKS in $content
do
command $WORKS
done
