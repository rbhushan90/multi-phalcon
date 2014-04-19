<?php


class Accounttransfer extends \Phalcon\Mvc\Model
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
    public $recipientAccount;
     
    /**
     *
     * @var string
     */
    public $transferAccount;
     
    /**
     *
     * @var double
     */
    public $money;
     
    /**
     *
     * @var string
     */
    public $content;
     
    /**
     *
     * @var string
     */
    public $status;
     
    /**
     * Initialize method for model.
     */
    public function initialize()
    {
		$this->setSource('accountTransfer');

    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap() {
        return array(
            'id' => 'id', 
            'recipientAccount' => 'recipientAccount', 
            'transferAccount' => 'transferAccount', 
            'money' => 'money', 
            'content' => 'content', 
            'status' => 'status'
        );
    }

}
