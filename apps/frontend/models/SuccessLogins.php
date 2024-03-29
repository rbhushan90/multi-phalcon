<?php

namespace Eduapps\Frontend\Models;

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
		$this->belongsTo('usersId', 'Nginx\Frontend\Models\Users', 'id', array(
			'alias' => 'user'
		));
	}

}