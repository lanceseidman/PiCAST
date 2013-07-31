<?php
// GRAB PiCAST

// CONNECT TO YOUR DB
$res = mysql_connect("localhost","<sql_username>","<sql_password>");
// CONNECT SELECT THE DB
mysql_select_db("<sql_table>", $res);

// MAKE QUERY FOR SELECTING ITEMS (0 Min. Max. 1)
$query = "SELECT * FROM `Items` LIMIT 0, 1 "; 

$which = $res;
$sth = mysql_query($query,$which);

while($row = mysql_fetch_assoc($sth))
{
  // LET'S SEE IF WEBSITES EXIST...
  if($row['website'] == null)
	{
	  // For Debug: echo "No Website...";
	}
	else // Website Exists!
	{
      // THIS WILL BE OUTPUT IN PLAINTEXT FOR RUNNING
       echo $row['website']; 
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
