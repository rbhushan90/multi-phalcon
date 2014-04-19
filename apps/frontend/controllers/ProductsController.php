<?php

namespace Eduapps\Frontend\Controllers;

use Eduapps\Frontend\Products;

class ProductsController extends \Phalcon\Mvc\Controller
{

	public function indexAction()
	{
		return $this->response->redirect('/login');
	}

}