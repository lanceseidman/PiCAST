#!/bin/bash
echo "Going to grab YouTube Audio..."
sleep 2
for URL in "$@"
do
youtube-dl -t --extract-audio --audio-format mp3 $URL
echo "Have a nice day!"
done
