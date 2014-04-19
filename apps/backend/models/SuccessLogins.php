<?php namespace Eduapps\Backend\Models;

use Phalcon\Mvc\Model;

/**
 * SuccessLogins
 *
 * This model registers successfull logins registered users have made
 */
class SuccessLogins extends Model
{
	/**
	 * @var integer
	 */
	public $id;

	/**
	 * @var integer
	 */
	public $usersId;

	/**
	 * @var string
	 */
	public $ipAddress;

	/**
	 * @var string
	 */
	public $userAgent;

	public function initialize()
	{
		$this->belongsTo('usersId', 'Eduapps\Backend\Models\Users', 'id', array(
			'alias' => 'user'
		));
		//test relation
		/*$this->belongsTo('id', 'Eduapps\Backend\Models\Profiles', 'id', array(
			'alias' => 'profiles'
		));*/
	}

}