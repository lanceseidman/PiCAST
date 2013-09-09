<?php
require_once(realpath(dirname(__FILE__).DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.'configuration.php');
require_once(realpath(dirname(__FILE__).DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.'db.php');

$query = "SELECT * FROM `Items` LIMIT 1 "; 
 $sth = Database::Reader($query);

while($row = Database::Read($sth))
{
	$order = '';
	if(!is_null($row['website']) && $row['website']!='')
	{
           echo $row['website'];	   // OUTPUT WEBSITE URL FOR PICAST
	}else if(!is_null($row['youtube']) && $row['youtube']!='')
	{
           echo $configuration['browser'] .' '. $configuration['youtube']['handler_prefix'] . $row['youtube'];
	}

	$order = "DELETE FROM `Items` WHERE `ID`=".$row['ID'];	
	Database::NonQuery($order);
}


Database::Reset();
//there's no true reason for this, it will automatically be unload and free on exit

?>
