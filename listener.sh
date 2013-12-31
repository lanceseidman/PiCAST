#!/bin/bash

############################################
# PiCAST Listener
# ------------------------------------------
# Setup: chmod +x listener.sh
# Start Command: sh /listener.sh
############################################

# Port is 2555; Modify for Firewall/Pref.
nc -l -p 2555 | ./srvss.sh
