#!/bin/bash
echo "Going to grab YouTube Video..."
sleep 2
for URL in "$@"
do
youtube-dl -o ytvid.flv $URL
echo "Have a nice day!"
done
