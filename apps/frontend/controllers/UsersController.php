<?php

namespace Eduapps\Frontend\Controllers;

use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Paginator\Adapter\Model as Paginator;

use Eduapps\Forms\ChangePasswordForm,
	Eduapps\Forms\SignUpForm,
	Eduapps\Forms\TransferForm,
	Eduapps\Frontend\Models\Users,
	Eduapps\Frontend\Models\PasswordChanges;

/**
 * Eduapps\Controllers\UsersController
 *
 * CRUD to manage users
 */
class UsersController extends ControllerBase
{

    public function initialize()
    {
    	$this->view->setTemplateBefore('private');
	}

	/**
	 * Default action, shows the search form
	 */
	public function indexAction()
	{
		$this->persistent->conditions = null;
		$this->view->form = new SignUpForm();
	}

	/**
	 * Searches for users
	 */
	public function searchAction()
	{
		$numberPage = 1;
		if ($this->request->isPost()) {
			$query = Criteria::fromInput($this->di, 'Eduapps\Models\Users', $this->request->getPost());
			$this->persistent->searchParams = $query->getParams();
		} else {
			$numberPage = $this->request->getQuery("page", "int");
		}

		$parameters = array();
		if ($this->persistent->searchParams) {
			$parameters = $this->persistent->searchParams;
		}

		$users = Users::find($parameters);
		if (count($users) == 0) {
			$this->flash->notice("The search did not find any users");
			return $this->dispatcher->forward(array(
				"action" => "index"
			));
		}

		$paginator = new Paginator(array(
			"data" => $users,
			"limit" => 10,
			"page" => $numberPage
		));

		$this->view->page = $paginator->getPaginate();
	}

	/**
	 * Creates a User
	 *
	 */
	/*public function createAction()
	{
		if ($this->request->isPost()) {

			$user = new Users();

			$user->assign(array(
				'username' => $this->request->getPost('username', 'striptags'),
				'profilesId' => $this->request->getPost('profilesId', 'int'),
				'email' => $this->request->getPost('email', 'email'),
			));

			if (!$user->save()) {
				$this->flash->error($user->getMessages());
			} else {

				$this->flash->success("User was created successfully");

				Tag::resetInput();
			}
		}

		$this->view->form = new UsersFrontForm(null);
	}*/

	/**
	 * Saves the user from the 'edit' action
	 *
	 */
	/*public function editAction($id)
	{

		$user = Users::findFirstById($id);
		if (!$user) {
			$this->flash->error("User was not found");
			return $this->dispatcher->forward(array('action' => 'index'));
		}

		if ($this->request->isPost()) {

			$user->assign(array(
				'username' => $this->request->getPost('username', 'striptags'),
				'profilesId' => $this->request->getPost('profilesId', 'int'),
				'email' => $this->request->getPost('email', 'email'),
				'banned' => $this->request->getPost('banned'),
				'suspended' => $this->request->getPost('suspended'),
				'active' => $this->request->getPost('active')
			));

			if (!$user->save()) {
				$this->flash->error($user->getMessages());
			} else {

				$this->flash->success("User was updated successfully");

				Tag::resetInput();
			}

		}

		$this->view->user = $user;

		$this->view->form = new UsersForm($user, array('edit' => true));
	}*/

	
	public function transferAction()
	{
		$this->persistent->conditions = null;
		$this->view->form = new TransferForm();
	}

	/**
	 * Users must use this action to change its password
	 *
	 */
	public function changePasswordAction()
	{
		$form = new ChangePasswordForm();

		if ($this->request->isPost()) {

			if (!$form->isValid($this->request->getPost())) {

				foreach ($form->getMessages() as $message) {
					$this->flash->error($message);
				}

			} else {

				$user = $this->auth->getUser();

				$user->password = $this->security->hash($this->request->getPost('password'));
				$user->mustChangePassword = 'N';

				$passwordChange = new PasswordChanges();
				$passwordChange->user = $user;
				$passwordChange->ipAddress = $this->request->getClientAddress();
				$passwordChange->userAgent = $this->request->getUserAgent();

				if (!$passwordChange->save()) {
					$this->flash->error($passwordChange->getMessages());
				} else {

					$this->flash->success('Your password was successfully changed');

					Tag::resetInput();
				}

			}

		}

		$this->view->form = $form;
	}

}
