<?php
// INSERT ITEMS IN TO PiCAST DB

// CONNECT TO YOUR DB
$res = mysql_connect("localhost","<sql_username>","<sql_password>");
// CONNECT SELECT THE DB
mysql_select_db("<sql_table>", $res);

// DOES THE WEBSITE TAG EXIST?
if($_GET["website"])  
{
 // IT EXISTS! LET'S STORE IT FOR OUR DATABASE QUERY
 // - WE'LL USE MIDORI AS FULLSCREEN BROWSER...
 $website = "midori -e Fullscreen -a ".$_GET["website"];
 //Debug: echo 'Found Website, going to process it!";
}

if($_GET["youtube"]) 
{
 $youtube = $_GET["youtube"];
 //Debug: echo "Found YT Video!";
}

if($_GET["image"]) 
{
 $image = $_GET["image"];
 //Debug: echo "Found Image!";
}

if($_GET["map"]) 
{
 $map = $_GET["map"];
 //Debug: echo "Found Map!";
}

if($_GET["music"]) 
{
 $music = $_GET["music"];
 //Debug: echo "Found Music!";
}


/* MAKE SURE ONLY 1 TASK IS RECEIVED!
if($image . $map . $music)
** CODE TO BE FINISHED IN NEXT VERSION! */

// CREATE SQL QUERY FOR DATABASE
$query = "INSERT INTO `vsweb_picast`.`Items` (`ID`, `website`, `image`, `map`, `youtube`) VALUES (NULL, '$website', '$image', '$map', '$youtube');";
$which = $res;
// PERFORM THE INSERT IN TO PiCAST DATABASE
$sth = mysql_query($query,$which);
mysql_close($res);

?>

