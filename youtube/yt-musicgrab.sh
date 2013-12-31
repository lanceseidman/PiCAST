#!/bin/bash
echo "Going to grab YouTube Audio..."
sleep 2
for URL in "$@"
do
youtube-dl -t --extract-audio --audio-format mp3 $URL ytaudio.mp3
mplayer -fs ytaudio.mp3
echo "Have a nice day!"
done
