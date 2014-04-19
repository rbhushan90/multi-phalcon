<?php namespace Eduapps\Frontend\Models;

use Phalcon\Mvc\Model,
    Phalcon\Mvc\Model\Validator\Uniqueness,
    Phalcon\Mvc\Model\Validator\Email;
class Contact extends Model
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
    public $name;
     
    /**
     *
     * @var string
     */
    public $email;
     
    /**
     *
     * @var string
     */
    public $comments;
     
    /**
     *
     * @var string
     */
    public $created_at;
     
    /**
     * Validations and business logic
     */
    public function validation()
    {

        $this->validate(
            new Email(
                array(
                    "field"    => "email",
                    "required" => true,
                )
            )
        );
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap() {
        return array(
            'id' => 'id', 
            'name' => 'name', 
            'email' => 'email', 
            'comments' => 'comments', 
            'created_at' => 'created_at'
        );
    }

}
