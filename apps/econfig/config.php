<?php

return new \Phalcon\Config(array(
	'database' => array(
		'adapter'     => 'Mysql',
		'host'        => '127.0.0.1',
		'username'    => 'root',
		'password'    => 'qazwsx2013@',
		'dbname'      => 'vokuro',
	),
	'application' => array(
		'controllersBack' => __DIR__ . '/../../apps/backend/controllers/',
		'modelsBack'      => __DIR__ . '/../../apps/backend/models/',
		'formsBack'       => __DIR__ . '/../../apps/forms/',
		'viewsBack'       => __DIR__ . '/../../apps/backend/views/',
		'libraryBack'     => __DIR__ . '/../../apps/backend/library/',
		'pluginsBack'     => __DIR__ . '/../../apps/backend/plugins/',
		'cacheBack'       => __DIR__ . '/../../apps/backend/cache/',
		'viewsFront'      => __DIR__ . '/../../apps/frontend/views/',
		'cacheFront'      => __DIR__ . '/../../apps/frontend/cache/',
		'baseUri'        	 => '/book-shop/',
		'publicUrl'		     => 'Eduapps.phalconphp.com',
		'cryptSalt'		     => '$9diko$.f#11'
	)/*,
	'mail' => array(
		'fromName' => 'Eduapps',
		'fromEmail' => 'fcopensuse@gmal.com',
		'smtp' => array(
			'server' => 'smtp.gmail.com',
			'port' => 587,
			'security' => 'tls',
			'username' => 'fcopensuse',
			'password' => 'matkhaulagi',
		)
	),
	'amazon' => array(
		'AWSAccessKeyId' => "",
		'AWSSecretKey' => ""
	)*/
));
