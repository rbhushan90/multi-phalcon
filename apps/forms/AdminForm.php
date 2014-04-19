<?php namespace Eduapps\Forms;

use Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Select,
	Phalcon\Forms\Element\Date,
	Phalcon\Forms\Element\Numeric,
	Phalcon\Forms\Element\Hidden,
	Phalcon\Forms\Element\Password,
	Phalcon\Forms\Element\Submit,
	Phalcon\Forms\Element\Check,
	Phalcon\Validation\Validator\PresenceOf,
	Phalcon\Validation\Validator\Email,
	Phalcon\Validation\Validator\Identical,
	Phalcon\Validation\Validator\StringLength,
	Phalcon\Validation\Validator\Confirmation;
use Eduapps\Backend\Models\KhoaDonvi,
	Eduapps\Backend\Models\Khoahoc,
	Eduapps\Backend\Models\Hedaotao;


class AdminForm extends Form
{

	public function initialize()
	{
		//username
		$username = new Text('username', array(
			'placeholder' => 'username'
		));

		$username->addValidators(array(
			new PresenceOf(array(
				'message' => 'Tài khoản không được rỗng'
			))
			
		));

		$this->add($username);

		//Password
		$password = new Password('password', array(
			'placeholder' => 'Password'
		));

		$password->addValidator(
			new PresenceOf(array(
				'message' => 'Mật khẩu không được rỗng'
			))
		);

		$this->add($password);

		//Remember
		$remember = new Check('remember', array(
			'value' => 'yes'
		));

		$remember->setLabel('Remember me');

		$this->add($remember);

		//CSRF
		$csrf = new Hidden('csrf');

		$csrf->addValidator(
			new Identical(array(
				'value' => $this->security->getSessionToken(),
				'message' => 'CSRF validation failed'
			))
		);

		$this->add($csrf);

		
	}
	/**
	 * Prints messages for a specific element
	 */
	public function messages($name)
	{
		if ($this->hasMessagesFor($name)) {
			foreach ($this->getMessagesFor($name) as $message) {
				$this->flash->error($message);
			}
		}
	}

}