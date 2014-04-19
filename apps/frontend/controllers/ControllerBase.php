<?php namespace Eduapps\Frontend\Controllers;

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
		if ($this->aclFront->isPrivate($controllerName)) {

			//Get the current identity
			$identity = $this->authFront->getIdentity();

			/*echo "<pre>";
			print_r($identity);
			echo "<pre>";
			print_r($this->acl->_filePath);*/
			
			//If there is no identity available the user is redirected to index/index
			if (!is_array($identity)) {
				$this->flash->notice('Bạn không đủ quyền để truy cập: private');

				$dispatcher->forward(array(
					'controller' => 'index',
					'action' => 'index'
				));
				return false;
			}

			//Check if the user have permission to the current option
			$actionName = $dispatcher->getActionName();
			
			if (!$this->aclFront->isAllowed($identity['profile'], $controllerName, $actionName)) {
				//print_r($identity);
				$this->flash->notice('Bạn không đủ quyền để truy cập module: ' . $controllerName . ':' . $actionName);

				if ($this->aclFront->isAllowed($identity['profile'], $controllerName, 'index')) {
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