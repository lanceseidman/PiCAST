PiCAST turns your $35 Raspberry Pi in to a Chromecast like Device.
=

**** SETUP NEEDED ****

1). Install Apache2

> sudo apt-get install apache2 apache2-utils

2). Install PHP5

> sudo apt-get install libapache2-mod-php5 php5 php-pear php5-xcache

3). Install MySQL

> sudo apt-get install php5-mysql

> sudo apt-get install mysql-server mysql-client

Enter a root Password (DO NOT FORGET; CASE-SENSITIVE)

4). Install PHPMyAdmin

> sudo apt-get install phpmyadmin

Select apache 2 >> Press OK 

-------------------------------------------------------------------------------------

**** TEST HTTPD + PHP ****

1). Open Midori, type:
>http://localhost & press [Enter].

** If you get a page that says "It works!" Move on to Step 2. Otherwise, check
your settings or ensure you're not blocking Port 80 or ensure that's the correct port.

2). Open Terminal (any) and type:
>sudo pico test.php & press [Enter].

2.1). Type
><?php phpinfo(); ?> & press Ctrl + X, press Y, press [Enter].

2.2). Type:
>sudo cp test.php /var/www/test.php & press [Enter].

3). In Midori, type:
>http://localhost/test.php

** If it shows PHP install details, it was successful.

**** SETUP DATABASE ****

1). Create new MySQL User + Password

2). Create new Database (e.g. picast)

3). Add User to new Database w/FULL Privledges

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

complete   TEXT        N/A         None         N/A         N/A       N/A     N/A  

3.3). Click Save to create Database

API USEAGE
=

Website Launcher
>http://localhost/goCAST.php?website=google.com
