<?php namespace Eduapps\Backend\Controllers;

use Phalcon\Mvc\Controller,
	Phalcon\Mvc\Dispatcher;

/**
 * ControllerBase
 *
 * This is the base controller for all controllers in the application
 */
class ControllerBase extends Controller
{
	public function beforeExecuteRoute(Dispatcher $dispatcher)
	{
		$controllerName = $dispatcher->getControllerName();

		//Only check permissions on private controllers
		if ($this->acl->isPrivate($controllerName)) {

			//Get the current identity
			$identity = $this->auth->getIdentity();

			/*echo "<pre>";
			print_r($identity);
			echo "<pre>";*/
			
			//If there is no identity available the user is redirected to index/index
			if (!is_array($identity)) {
				echo "notis array()";
				$this->flash->notice('You don\'t have access to this module: private');

				$dispatcher->forward(array(
					'controller' => 'index',
					'action' => 'index'
				));
				return false;
			}

			//Check if the user have permission to the current option
			$actionName = $dispatcher->getActionName();
			if (!$this->acl->isAllowed($identity['profile'], $controllerName, $actionName)) {
				$this->flash->notice('You don\'t have access to this module: ' . $controllerName . ':' . $actionName);

				if ($this->acl->isAllowed($identity['profile'], $controllerName, 'index')) {
					
					$dispatcher->forward(array(
						'controller' => $controllerName,
						'action' => 'index'
					));
				} else {
					$dispatcher->forward(array(
						'controller' => 'user_control',
						'action' => 'index'
					));
				}

				return false;
			}

		}
	}
	/*public function afterExecuteRoute(Dispatcher $dispatcher)
	{

	}*/
}