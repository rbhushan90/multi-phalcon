<?php namespace Eduapps\Backend\Models;

use Phalcon\Mvc\Model;

/**
 * Permissions
 *
 * Stores the permissions by profile
 */
class Permissions extends Model
{
	/**
	 * @var integer
	 */
	public $id;

	/**
	 * @var integer
	 */
	public $profilesId;

	/**
	 * @var string
	 */
	public $resource;

	/**
	 * @var string
	 */
	public $action;

	public function initialize()
	{
		/*$this->belongsTo('profilesId', 'Eduapps\Models\Profiles', 'id', array(
			'alias' => 'profile'
		));*/
	}

}