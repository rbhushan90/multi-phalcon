<?php namespace Eduapps\Frontend;

use Phalcon\DI\FactoryDefault,
	Phalcon\Mvc\View,
	Phalcon\Crypt,
	Phalcon\Mvc\Dispatcher,
	Phalcon\Mvc\Url as UrlResolver,
	Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter,
	Phalcon\Mvc\View\Engine\Volt as VoltEngine,
	Phalcon\Mvc\Model\Metadata\Files as MetaDataAdapter,
	Phalcon\Session\Adapter\Files as SessionAdapter,
	Phalcon\Flash\Direct as Flash;

use Eduapps\Auth\AuthFront,
	Eduapps\Acl\AclFront,
	Eduapps\Mail\Mail,
	Eduapps\PHPExcel\PHPExcel;
class Module
{

	public function registerAutoloaders()
	{

		$loader = new \Phalcon\Loader();
		$loader->registerNamespaces(array(
			'Eduapps\Frontend\Controllers' => __DIR__.'/controllers/',
			'Eduapps\Frontend\Models' =>  __DIR__.'/models/',
			'Eduapps\Frontend\Plugins' => __DIR__.'/plugins/',
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
			$dispatcher->setDefaultNamespace('Eduapps\Frontend\Controllers');
			
			return $dispatcher;
			});

		
			$di->set('view', function() use ($config) {

				$view = new View();

				$view->setViewsDir($config->application->viewsFront);

				$view->registerEngines(array(
					'.volt' => function($view, $di) use ($config) {

						$volt = new VoltEngine($view, $di);

						$volt->setOptions(array(
							'compiledPath' => $config->application->cacheFront . 'volt/',
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