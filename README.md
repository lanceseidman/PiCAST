# PiCAST 3 (MICRO EDITION; STREAMING FIRST)
PiCAST turns your $35 Raspberry Pi in to a Chromecast and beyond like Device.

<b>GET/INSTALL PiCAST</b>

1). Download the setup.sh file and in a terminal (on your Pi) type: chmod +x setup.sh

2). After setup is done? Make sure it's running, in a browser visit: http://ip-to-your-Pi:3000.

Note: PiCAST uses Forever which means PiCAST runs forever, UNTIL the Pi Reboots.

3). Try streaming a Video (e.g. YouTube) by typing: http://ip-to-pi:3000/yt-stream/<YouTube Video ID>

That's it! We've made PiCAST as easy and small as possible using web technologies. This will run easy on
almost ANY Linux Distro as well that's Debian based or modify to run on RHEL/CENT.

<b>PiCAST COMMANDS (CURRENT)</b>

Start PiCAST: sh /path-to/PiCAST/picast_start.sh 

Stop PiCAST: sh /path-to/PiCAST/picast_stop.sh 

BROWSER REQUESTS

Stream YouTube Video: http://pi-ip:3000/yt-stream/video-id


<b>I WANT MORE COMMANDS!</b>

I've made PiCAST3 so simple, anyone can add/create his/her own feature they'd like BUT I do ask that you'd
release it to the project so that everyone can enjoy your new features and so on. I have more coming, but
this was just to get this edition out already.

<b>MY PI REBOOTED, PICAST DOESN'T WORK!</b>

As I mentioned before, once your Pi reboots you'll need to manually type the forever command (see above)
OR you can just cd into the PiCAST Directory (e.g. cd /home/pi/PiCAST) and type: sh picast_start.sh OR
just type & paste: sh /home/pi/PiCAST/picast_start.sh

<b>Why Make PiCAST?</b>

Several years back I wanted to buy a Google Chromecast originally but it was sold out. So, I thought what do I have that I could use w/HDMI and wouldn't be terribly hard to do? My Raspberry Pi can do it all & now the PiZERO can too!

As Chromecast has changed over the past few years, my interest in this project went away... BUT... I had some time off and wanted to see how tiny we could make PiCAST (not including just the requirements- which to be debated). So, PiCAST 3 is here.

<b>THIS ISN'T CHROMECAST! YOU LIE!!!</b>

As many seem unable to read or understand where the project CURRENTLY is and where it WILL go, I felt I need to dumb it down even more. This project doesn't have over 20-100+ paid-staffers, millions of dollars backed to ensure it succeeds, a dedicated team, and MONTHS & MONTHS of work where the PiCAST HAS NONE OF THE ABOVE-- so, calm down!

I made it very clear, this is "LIKE" a chromecast, as it can be sent commands REMOTELY just like the Chromecast (now via Browser/HTTP Request via CURL or even WGET)... I am working on the BEST possible method(s) to continue forward.

So before you go nuts that the project isn't what YOU think, think twice. I do have a full-time job BUT I am so upset with Google, I want an OPEN, FREE, US/NON-US PERMITTED USERBASE, and if you're against it? Don't download it, go make your own and share it or don't. 

<b>WHAT TO EXPECT TO BE INSTALLED...</b>

python-dev python-pip nodejs npm youtube-dl lame mpg321

<b>I WANT MY TIME/FREE EXCHANGE! WHO DO I COMPLAIN TO?</b>

Easy does it... Tweet me, @LanceSeidman as that's the best chance of a response.
