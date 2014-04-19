<?php namespace Eduapps\Backend\Controllers;

use Eduapps\Forms\AdminForm,
	Eduapps\Forms\SignUpForm,
	Eduapps\Forms\ForgotPasswordForm,
	Eduapps\Auth\Auth,
	Eduapps\Auth\Exception as AuthException,
	Eduapps\Models\Users,
	Eduapps\Models\ResetPasswords;
class IndexController extends ControllerBase
{
	//login author
	public function indexAction()
	{
    	//$this->view->setTemplateBefore('login');

    	$form = new AdminForm();
    	try {
    		if (!$this->request->isPost()) {

				if ($this->auth->hasRememberMe()) {
					return $this->auth->loginWithRememberMe();
				}
				//check if login without check remember
				/*$identity = $this->auth->getIdentity();
				print_r($identity);*/
				$identity = $this->auth->getIdentity();
				//print_r($identity);
				if (is_array($identity)) {
					return $this->response->redirect('admin/users');
				}
			} else {
				//valdate and print error in LoginForm function messages
				if ($form->isValid($this->request->getPost())==true) {
					/*foreach ($form->getMessages() as $message) {
						//print_r($message);
						$this->flash->error($message);
					}*/
					$this->auth->check(array(
						'username' => $this->request->getPost('username'),
						'password' => $this->request->getPost('password'),
						'remember' => $this->request->getPost('remember')
					));

					return $this->response->redirect('admin/users');
				}
			}
    		
    	} catch (Exception $e) {
    		$this->flash->error($e->getMessage());
    	}
    	$this->view->form = $form;
	}

	public function forgotPasswordAction()
    {
    	echo("khoi phuc mat khau");
    }
    public function logoutAction()
    {
    	$this->auth->remove();

		return $this->response->redirect('admin');
    }
}