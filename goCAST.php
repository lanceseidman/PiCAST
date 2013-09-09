<?php
// THIS FILES INSERTS ITEMS IN TO PiCAST DB
require_once(realpath(dirname(__FILE__).DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.'configuration.php');
require_once(realpath(dirname(__FILE__).DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.'db.php');


$website = isset($_GET['website']) ? Database::escape(trim($_GET['website'])) : ''; 
$youtube = isset($_GET['youtube']) ? Database::escape(trim($_GET['youtube'])) : ''; 
$image =  isset($_GET['image']) ? Database::escape(trim($_GET['image'])) : '';  
$map = isset($_GET['map']) ? Database::escape(trim($_GET['map'])) : ''; 
$music = isset($_GET['music']) ? Database::escape(trim($_GET['music'])) : '';

// CREATE SQL QUERY FOR DATABASE
$query = 'INSERT INTO `vsweb_picast`.`Items` (`ID`, `website`, `image`, `map`, `youtube`) VALUES '.
	'(NULL, "'.$website.'", "'.$image.'", "'.$map.'", "'.$youtube.'")';

if ($website || $youtube || $image || $map || $music)
{ //only save if there's something to save
	Database::NonQuery($query);
	Database::Reset();
	echo json_encode(true);
}else{
	echo json_encode(false);
}
?>

