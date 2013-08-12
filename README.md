PiCAST (beta)
===
<h3>Turn a $35 Raspberry Pi in to a Chromecast like Device, for FREE.</h3>
<hr>

<h3><u>Why Make the PiCAST?</u></h3>
I wanted to buy a Google Chromecast but it was sold out, thanks to people like Leo from TWiT who got 5 (kidding)!
So, I thought what do I have that I could use w/HDMI [licensing] and wouldn't be terribly hard to do? My Arduino?
Nope BUT my Raspberry Pi can do it all, literally and same price as the Chromecast.

<h3><u>Why Open Source?</u></h3>
I'm not happy how the Chromecast isn't very open... So, with the easy to use API-like calling, you can just call the URL
and yes the project is far from complete-- it's just a fun learning exercise & hope kids will see how you can go and
try to mimmic what you can't get it (even if you have the cash).

<b>This is <i>far</i> from complete. Lot of new features to come and of course fix the code up. But, at least we have something
to start playing with...</b>

<h1>USE AT OWN RISK. UPDATES ARE CONSTANT. METHODS <B><u>WILL</u></B> CHANGE OFTEN! UNLESS SOMETHING SAYS STABLE, ASSUME A BETA.</h1>

<h3><u>Donate with BitCoin!</u></h3>
A friend of mine has already bugged me, to charge for the code... I can't or won't. I will however as always offer my
BitCoin address for anyone who'd like to donate, donations will go to Opportunity Village(http://www.opportunityvillage.org).

<b>BitCoin Address: 16b3QAFmjrh4yzHjLw7jAKG5AnV8WVXdCK</b>

<b>No BitCoin? PayPal: lance@compulsivetech.biz</b>

*** YOU DO NOT HAVE TO DONATE. THIS IS OF COURSE COMPLETELY OPTIONAL, THIS WILL ALWAYS REMAIN FREE! ***

<h3><u>LICENSE</u></h3>

PLEASE READ THE LICENSE FILE BEFORE READING ANY CODE, DOWNLOADING CODE, STORING CODE, SHARING CODE, AND USING THE CODE.

*WILLS LAW: OBEY OS LANG!*

<img src="http://www.gnu.org/graphics/gplv3-127x51.png" alt="GPL LOGO" title="GPL LOGO">


<h3><u>Watch it in Action!</u></h3>
https://www.youtube.com/watch?v=HUgbCoORkYM
<iframe width="420" height="315" src="//www.youtube.com/embed/HUgbCoORkYM" frameborder="0" allowfullscreen></iframe>

<hr><h2>Get Started!</h2>

<b><h2>**** SETUP NEEDED (BETA) ****</h2></b>

Simply download installer.sh, open a Terminal and type:

> chmod +x installer.sh

> sh installer.sh


<b>-- MySQL MUST READ --</b>

You will be asked to insert a MySQL Password, this is important. Please type "thePICAST" & confirm when asked.



*** ADVANCED USERS USE BELOW METHODS ***

0). Update the Database!
> sudo apt-get update

1). Install Apache2

> sudo apt-get install apache2 apache2-utils

2). Install PHP5

> sudo apt-get install libapache2-mod-php5 php5 php-pear php5-xcache

3). Install MySQL
 
> sudo apt-get install php5-mysql

> sudo apt-get install mysql-server mysql-client

Enter a root Password (DO NOT FORGET; CASE-SENSITIVE)

4). Install Gnash (Flash Support for Midori) - For Flash, WebM Support (OPTIONAL)

> sudo apt-get gnash

> sudo apt-get install browser-plugin-gnash 

Want to know more about Gnash + Flash? I have a video on YouTube.com/TechMeShow

5). Remote Control of Pi (OPTIONAL)

> sudo apt-get install xdm

** WINDOWS: Visit http://sourceforge.net/projects/xming

1). Install successfully & run.

2). In PuTTY Configure to connect to the PiCAST Server.

2a). Select Session: Connection Type SSH & Type Hostname/IP

2b). Select Connection>X11>Enable X11 Forwarding.

2c). Select Connection>X11>display location: localhost:0

2d). Select Connection>X11>XDM-Authorization

2e). Click on the 'Open' Button

3). After you login, type anything you wish to load for control (e.g. Midori).

** OSX: Open Terminal, type: xhost + PiCAST_ServerName (Only first time!!!) & connect, type:
> ssh -X user-name@PiCAST_ServerName

-------------------------------------------------------------------------------------

**** TEST HTTPD + PHP ****

1). Open Midori, type:
>http://localhost & press [Enter].

** If you get a page that says "It works!" Move on to Step 2. Otherwise, check
your settings or ensure you're not blocking Port 80 or ensure that's the correct port.

2). Open Terminal (any) and type:
> sudo pico test.php & press [Enter].

2.1). Type
> <?php phpinfo(); ?> & press Ctrl + X, press Y, press [Enter].

2.2). Type:
> sudo cp test.php /var/www/PiCAST/test.php & press [Enter].

3). In Midori, type:
> http://localhost/PiCAST/test.php

** If it shows PHP install details, it was successful.

**** SETUP DATABASE ****

1). Create new MySQL User + Password
> CREATE USER 'picast'@'localhost' IDENTIFIED BY 'piCAST1337';

2). Create new Database (e.g. picast)
> CREATE DATABASE picast;

3). Add User to new Database w/FULL Privledges
> GRANT ALL PRIVILEGES ON picast . Items TO 'picast'@'localhost';

> FLUSH PRIVLEGES;

**** PHPMYADMIN ****

1). Login to the Script

2). Find your Database, Select it (click it from the Left)

3). Click 'Create new Table' Button.

3.1). Name: Items, Columns: 5, then press Go (to the right)

3.2). Type as seen below in to Structure:

Name       Type   Length/Values   Default   Coallation   Attributes   Null   A_I

ID         INT         30          None         N/A         N/A       N/A     X

website    LONGTEXT    N/A         None         N/A         N/A       N/A     N/A    

image      LONGTEXT    N/A         None         N/A         N/A       N/A     N/A  

map        LONGTEXT    N/A         None         N/A         N/A       N/A     N/A  

youtube    TEXT        N/A         None         N/A         N/A       N/A     N/A  

3.3). Click Save to create Database

**** GET PiCAST READY ****

1). Move goCAST.php & grabCAST.php to /var/www/PiCAST as we did in HTTPD Test (above). I recommend making a directory.

2). CHMOD grabber.sh (Keep in Personal Home Directory)
> sudo chmod +x grabber.sh & press [Enter]

3). When you want to run PiCAST, simply type:
> watch -n 10 ./grabber.sh

*** Want to make it faster/slower? Change 10 to any number desired (each digit is a second)

API USEAGE
=

Website Launcher
> http://localhost/PiCAST/goCAST.php?website=google.com

YouTube Video Launcher (Added 08/02/13)
> http://localhost/PiCAST/goCAST.php?youtube=video_id

*** Soon we will parse the URL in the goCAST.php.

*** MORE COMMANDS TO COME... HOLD ON! ***

