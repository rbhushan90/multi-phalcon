<?php

error_reporting(E_ALL);

try {

	/**
	 * Read the configuration
	 */
	$config = include __DIR__ . "/../apps/econfig/config.php";

	/**
	 * Read auto-loader in Moudel in backeend vs forntend
	 */
	//include __DIR__ . "/../apps/econfig/loader.php";

	/**
	 * Read services
	 */
	include __DIR__ . "/../apps/econfig/services.php";

	/**
	 * Handle the request
	 */
	$application = new \Phalcon\Mvc\Application($di);
	$application->registerModules(array(
				'frontend' => array(
					'className' => 'Eduapps\Frontend\Module',
					'path' => '../apps/frontend/Module.php'
				),
				'backend' => array(
					'className' => 'Eduapps\Backend\Module',
					'path' => '../apps/backend/Module.php'
				)
	));

	echo $application->handle()->getContent();

} catch (Exception $e) {
	echo $e->getMessage(), '<br>';
	echo nl2br(htmlentities($e->getTraceAsString()));
	// Getting a response instance
	/*$response = new \Phalcon\Http\Response();

	//Set status code
	$response->setStatusCode(404, "Not Found");

	//Set the content of the response
	$response->setContent("Sorry, the page doesn't exist");

	//Send response to the client
	$response->send();*/
}
