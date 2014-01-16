#!/bin/bash
echo "Going to grab YouTube Audio..."
sleep 2
for URL in "$@"
do
youtube-dl -t --extract-audio --audio-format mp3 $URL
for f in $( find . -name "mp4" ); do
echo $f
mplayer -fs $f
done
echo "Have a nice day!"
done
