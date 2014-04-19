<?php
$router = new Phalcon\Mvc\Router();

$router->removeExtraSlashes(true);
			$router->setDefaultModule("frontend");
			$router->setDefaultAction("index");
			$router->setDefaultController("index"); 
			$router->add("/login", array(
				'module' => 'backend',
				'controller' => 'login',
				'action' => 'index',
			));
			$router->add("/admin", array(
				'module' => 'backend'
				 
			));
			$router->add('/admin/:controller', array(
				'module' => 'backend',
				'controller' => 1,
				'action' => 'index',
			));
			 
			$router->add('/admin/:controller/:action', array(
				'module' => 'backend',
				'controller' => 1,
				'action' => 2,
			));
			//Define a route
			$router->add(
				"/admin/:controller/:action/:params",
				array(
				'module' => 'backend',
					"controller" => 1,
					"action"     => 2,
					"params"     => 3,
				)
			);
return $router;
