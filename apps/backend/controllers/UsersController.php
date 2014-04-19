<?php namespace Eduapps\Backend\Controllers;


use Phalcon\Tag,
	Phalcon\Mvc\Model\Criteria,
	Phalcon\Paginator\Adapter\Model as Paginator;

use 
	Eduapps\Backend\Models\Users,
	Eduapps\Mail\Mail,// Mail\Mail lan luot la thu muc va file
	Eduapps\PhpExcels,//PhpExcels chinh la file
	Eduapps\Models\PasswordChanges,
	Eduapps\Forms\UsersForm;
	//require_once $_SERVER["DOCUMENT_ROOT"].'/eduapps/vendor/PHPExcel/PHPExcel.php';

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
	public function abcAction()
	{
		$this->view->form = "aaa";
	}

	/**
	 * Default action, shows the search form
	 */
	public function indexAction()
	{
		$this->persistent->conditions = null;
		$this->view->form = new UsersForm();
	}

	/**
	 * Searches for users
	 */
	public function searchAction()
	{
		$numberPage = 1;
		if ($this->request->isPost()) {
			$query = Criteria::fromInput($this->di, 'Eduapps\Backend\Models\Users', $this->request->getPost());
			//print_r($query);
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
	public function createAction()
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

				Tag::resetInput()	;
			}
		}

		$this->view->form = new UsersForm(null);
	}

	/**
	 * Saves the user from the 'edit' action
	 *
	 */
	public function editAction($id)
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
	}

	/**
	 * Deletes a User
	 *
	 * @param int $id
	 */
	public function deleteAction($id)
	{

		$user = Users::findFirstById($id);
		if (!$user) {
			$this->flash->error("User was not found");
			return $this->dispatcher->forward(array('action' => 'index'));
		}

		if (!$user->delete()) {
			$this->flash->error($user->getMessages());
		} else {
			$this->flash->success("User was deleted");
		}

		return $this->dispatcher->forward(array('action' => 'index'));
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

	public function deleteMutiAction()
	{
		
	 new PhpExcels();//khoi tao 
	$objPHPExcel= new \PhpExcel();//\ o day hieu la goi file class hien tai trong file nay

// Set document properties
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Test result file");


// Add some data
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', 'Hello')
            ->setCellValue('B2', 'world!')
            ->setCellValue('C1', 'Hello')
            ->setCellValue('D2', 'world!');

// Miscellaneous glyphs, UTF-8
$objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A4', 'Miscellaneous glyphs')
            ->setCellValue('A5', 'éàèùâêîôûëïüÿäöüç');

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Simple');


// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);


// Redirect output to a client’s web browser (Excel5)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="01simple.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header ('Pragma: public'); // HTTP/1.0

$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save('php://output');
exit;
		if ($this->request->isPost()) {
			echo "<pre>";
			print_r($this->request->getPost());
			$this->view->User= Users::find("substr(username,1,1)='p'");
		} else {
			echo "ccccccccccccc";
		}
		
		//$this->view->User= Users::find();

	
	}
}
