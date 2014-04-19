<?php namespace Eduapps\Backend\Models;

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Validator\Uniqueness;
class Users extends Model
{

    /**
     *
     * @var integer
     */
    public $id;
     
    /**
     *
     * @var string
     */
    public $username;
     
    /**
     *
     * @var string
     */
    public $email;
     
    /**
     *
     * @var string
     */
    //public $password='a';
     
    /**
     *
     * @var string
     */
    public $mustChangePassword=null;
     
    /**
     *
     * @var integer
     */
    //blic $profilesId;
     
    /**
     *
     * @var string
     */
    public $banned = NUll;
     
    /**
     *
     * @var string
     */
    public $suspended;
     
    /**
     *
     * @var string
     */
    public $active;
     
    /**
     * Before create the user assign a password
     */
    public function beforeValidationOnCreate()
    {
        if (empty($this->password)) {

            //Generate a plain temporary password
            $tempPassword = preg_replace('/[^a-zA-Z0-9]/', '', base64_encode(openssl_random_pseudo_bytes(12)));

            //The user must change its password in first login
            $this->mustChangePassword = 'Y';

            //Use this password as default
            $this->password = $this->getDI()->getSecurity()->hash($tempPassword);

        } else {
            //The user must not change its password in first login
            $this->mustChangePassword = 'N';

        }

        //The account must be confirmed via e-mail
        $this->active = 'Y';

        //The account is not suspended by default
        $this->suspended = 'N';

        //The account is not banned by default
        $this->banned = 'N';
    }

    /**
     * Send a confirmation e-mail to the user if the account is not active
     */
    public function afterSave()
    {
        if ($this->active == 'N') {

            $emailConfirmation = new EmailConfirmations();

            $emailConfirmation->usersId = $this->id;
            if ($emailConfirmation->save()) {
                $this->getDI()->getFlash()->notice(
                    'A confirmation mail has been sent to ' . $this->email
                );
            }
        }
    }

    /**
     * Validations and business logic
     */
 
    public function initialize()
    {

        $this->belongsTo('profilesId', 'Eduapps\Backend\Models\Profiles', 'id', array(
            'alias' => 'profile',
            'reusable' => true)
        );

        $this->hasMany('id', 'Eduapps\Backend\Models\SuccessLogins', 'usersId', array(
            'alias' => 'successLogins',
            'foreignKey' => array(
                'message' => 'User cannot be deleted because he/she has activity in the system'
            )
        ));

        $this->hasMany('id', 'Eduapps\Backend\Models\PasswordChanges', 'usersId', array(
            'alias' => 'passwordChanges',
            'foreignKey' => array(
                'message' => 'User cannot be deleted because he/she has activity in the system'
            )
        ));

        $this->hasMany('id', 'Eduapps\Backend\Models\ResetPasswords', 'usersId', array(
            'alias' => 'resetPasswords',
            'foreignKey' => array(
                'message' => 'User cannot be deleted because he/she has activity in the system'
            )
        ));
    }

    

}
