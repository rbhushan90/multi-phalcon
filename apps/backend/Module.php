<?php namespace Eduapps\Backend;

use Phalcon\DI\FactoryDefault,
	Phalcon\Mvc\View,
	Phalcon\Loader,
	Phalcon\Crypt,
	Phalcon\Mvc\Dispatcher,
	Phalcon\Mvc\View\Engine\Volt as VoltEngine,
	Phalcon\Mvc\Model\Metadata\Files as MetaDataAdapter,
	Phalcon\Session\Adapter\Files as SessionAdapter,
	Phalcon\Flash\Direct as Flash;
class Module
{

	public function registerAutoloaders()
	{

		$loader = new Loader();
		$loader->registerNamespaces(array(
			'Eduapps\Backend\Controllers'=> __DIR__.'/controllers/',
			'Eduapps\Backend\Models'	 => __DIR__.'/models/',
			'Eduapps\Backend\Plugins'	 => __DIR__.'/plugins/',
			'Eduapps' => '../apps/library/',
			'Eduapps\Forms' => '../apps/forms',
		));

		$loader->register();
	}

	/**
	 * Register the services here to make them general or register in the ModuleDefinition to make them module-specific
	 */
	public function registerServices($di)
	{
			$config = include __DIR__ . "/../econfig/config.php";

			//Registering a dispatcher
			$di->set('dispatcher', function() {
			$dispatcher = new Dispatcher();
			$dispatcher->setDefaultNamespace('Eduapps\Backend\Controllers');
			return $dispatcher;
			});
			
			/**
			 * Setting up the view component
 			*/
			$di->set('view', function() use ($config) {

				$view = new View();

				$view->setViewsDir($config->application->viewsBack);

				$view->registerEngines(array(
					'.volt' => function($view, $di) use ($config) {

						$volt = new VoltEngine($view, $di);

						$volt->setOptions(array(
							'compiledPath' => $config->application->cacheBack . 'volt/',
							'compiledSeparator' => '_'
						));
						//load function php
						$compiler = $volt->getCompiler();
						$compiler->addFunction('strtotime', 'strtotime');
						return $volt;
					}
				));

				return $view;
			}, true);
			
	}


}