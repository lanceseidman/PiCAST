<?php
if (!class_exists('Database')){
/**
* <b>Database Connection</b> class.
* @author Php Object Generator
* @version 3.0d / PHP5
* @see http://www.phpobjectgenerator.com/
* @copyright Free for personal & commercial use. (Offered under the BSD license)
* @notes modified version
*/
 Class Database
{
	public $connection;
	public static $executed_queries = array();
	static $database = NULL;

	private function Database()
	{
		$databaseName = $GLOBALS['configuration']['db']['db'];
		$serverName = $GLOBALS['configuration']['db']['host'];
		$databaseUser = $GLOBALS['configuration']['db']['user'];
		$databasePassword = $GLOBALS['configuration']['db']['pass'];
		$databasePort = $GLOBALS['configuration']['db']['port'];		
		$this->connection = mysql_connect ($serverName.":".$databasePort, $databaseUser, $databasePassword);
		if ($this->connection)
		{
			if (!mysql_select_db ($databaseName))
			{
				throw new Exception('I cannot find the specified database "'.$databaseName.'". Please edit configuration.php.');
			}
			if (isset($GLOBALS['configuration']) && isset($GLOBALS['configuration']['db']['encoding']) && !mysql_set_charset($GLOBALS['configuration']['db']['encoding'],$this->connection))
			{
				throw new Exception('I cannot change the charset at the connection with database "'.$databaseName.'". Please edit configuration.php.');
			}
		}
		else
		{
			throw new Exception('I cannot connect to the database. Please edit configuration.php with your database configuration. database '.$databaseName.' ; host '.$serverName.''); 
		}
	}


	public static function Reset() {
		if (isset(self::$database) && self::$database != NULL)
			mysql_close(self::$database->connection);
		self::$database  = NULL;
	}

	public static function Connect()
	{
		if (!isset(self::$database) || self::$database==NULL)
		{
			self::$database = new Database();
		}
		return self::$database->connection;
	}

	public static function Reader($query, $connection = null)
	{
		is_null($connection) && $connection=self::Connect();
		self::$executed_queries[] = $query;
		$cursor = mysql_query($query, $connection);
		if (!$cursor)
		{
			$traza = debug_backtrace();
			$trazatext = "";
			foreach($traza as $puntotraza)
			{
				$trazatext .="<br />".print_r($puntotraza,true);
			}

			error_log("Error SQL:" . $query.
						"<br />Error: ".mysql_error(self::$database->connection).
						"<br />Pila: ".$trazatext );
		}
		return $cursor;
	}

	public static function Read($cursor)
	{
		return mysql_fetch_assoc($cursor);
	}

	public static function NonQuery($query, $connection = null)
	{
		is_null($connection) && $connection=self::Connect();
		self::$executed_queries[] = $query;
		mysql_query($query, $connection);
		$result = mysql_affected_rows($connection);
		if ($result == -1)
		{
			return false;
		}
		return $result;
	}

	public static function Query($query, $connection = null)
	{
		is_null($connection) && $connection=self::Connect();
		self::$executed_queries[] = $query;
		$result = mysql_query($query, $connection);
		return mysql_num_rows($result);
	}

	public static function InsertOrUpdate($query, $connection = null)
	{
		is_null($connection) && $connection=self::Connect();
		self::$executed_queries[] = $query;
		$result = mysql_query($query, $connection);
		return intval(mysql_insert_id($connection));
	}
	
	public static function getNumQueries()
	{
		return count(self::$executed_queries);
	}

	public static function escape($str)
	{
		return mysql_real_escape_string($str,self::Connect());
	}
}
}
?>