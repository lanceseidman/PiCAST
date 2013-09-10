<?php

global $configuration;

!isset($configuration) || !is_array($configuration) || $configuration= array();

$configuration['db'] = array(
	'host' => 'localhost',
	'db' => 'picasts',
	'user' => 'piCASTER',
	'pwd' => 'piCAST1337',
	'port' => 3307,
	'enconding'=> 'utf8',
	'debug' => false,
);	

$configuration['youtube'] = array(
	'handler_prefix' => 'http://localhost/youtube.php?youtube='
);

$configuration['browser'] = 'midori -e Fullscreen -a ';
