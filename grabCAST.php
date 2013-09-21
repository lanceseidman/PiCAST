<?php
// GRAB PiCAST

// CONNECT TO YOUR DB
$res = mysql_connect("localhost","picast","piCAST1337");
// CONNECT SELECT THE DB
mysql_select_db("picaster", $res);

// MAKE QUERY FOR SELECTING ITEMS (0 Min. Max. 1)
$query = "SELECT * FROM `Items` LIMIT 0, 1 "; 

$which = $res; 
$sth = mysql_query($query,$which);

while($row = mysql_fetch_assoc($sth))
{
	if($row['website'] == null)
	{
	  // For Debug: echo "No Website...";
	}
	else // Website Exists!
	{
	   // OUTPUT WEBSITE URL FOR PICAST
           echo $row['website'];
           // CREATE QUERY TO DELETE ENTRY
	   $order = "DELETE FROM `Items` WHERE 1";
	   // GO SEND THE DELETE
	   mysql_query($order, $res);	
	}
	
	if($row['youtube'] == null)
	{
	  // For Debug: echo "No YouTube Video...";
	}
	else // Website Exists!
	{
        echo "midori -e Fullscreen -a http://localhost/youtube.php?youtube=". $row['youtube'];

        // CREATE QUERY TO DELETE ENTRY
	   $order = "DELETE FROM `Items` WHERE 1";
	   // GO SEND THE DELETE
	   mysql_query($order, $res);

	}


}

/* JSON OPTION
$rows = array();
while($r = mysql_fetch_assoc($sth)) {
    $rows[] = $r;
}
print json_encode($rows);
*/

// CLOSE THE SQL CONNECTION
mysql_close($res);

?>
