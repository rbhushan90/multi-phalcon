<?php

namespace Eduapps\Forms;

use Phalcon\Forms\Form,
	Phalcon\Forms\Element\Text,
	Phalcon\Forms\Element\Password,
	Phalcon\Forms\Element\Submit,
	Phalcon\Forms\Element\Check,
	Phalcon\Forms\Element\Hidden,
	Phalcon\Validation\Validator\PresenceOf,
	Phalcon\Validation\Validator\Email,
	Phalcon\Validation\Validator\Identical;

use Eduapps\Models\Profiles;
/**
 * validate login frontend user
 */
class LoginForm extends Form
{

	public function initialize()
	{
		//Email
		$email = new Text('email', array(
			'placeholder' => 'Email',
			'size' => "30",
			 'class'=> "input-xlarge"
		));

		$email->addValidators(array(
			new PresenceOf(array(
				'message' => 'Khong duoc rong'
			)),
			new Email(array(
				'message' => 'Định dạng email không đùng'
			))
		));

		$this->add($email);

		//Password
		$password = new Password('password', array(
			'placeholder' => 'Password',
			'size' => "30",
			 'class'=> "input-xlarge"
		));

		$password->addValidator(
			new PresenceOf(array(
				'message' => 'Mat khau khong dung'
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
				'message' => 'CSRF Khong chuan'
			))
		);

		$this->add($csrf);

		$this->add(new Submit('go', array(
			'class' => 'btn btn-primary btn-large'
		)));
	}

}