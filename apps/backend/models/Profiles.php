<?php

namespace Eduapps\Backend\Models;

use Phalcon\Mvc\Model;

/**
 * Eduapps\Models\Profiles
 *
 * All the users registered in the application
 */
class Profiles extends Model
{
	/**
	 * @var integer
	 */
	public $id;

	/**
	 * @var string
	 */
	public $name;

	/**
	 * @var string
	 */
	public $active;
	public function initialize()
	{
		$this->hasMany('id', 'Eduapps\Backend\Models\Users', 'profilesId', array(
			'alias' => 'users',
			'foreignKey' => array(
				'message' => 'Profile cannot be deleted because it\'s used on Users'
			)
		));

		$this->hasMany('id', 'Eduapps\Backend\Models\Permissions', 'profilesId', array(
			'alias' => 'permissions'
		));
		//test relation 
		
	}

}