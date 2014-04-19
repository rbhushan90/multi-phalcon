<?php namespace Eduapps\Frontend\Controllers;
    
use Eduapps\Frontend\Models\Contact;
class ContactController extends ControllerBase
{
    public function initialize()
    {
                $this->view->setTemplateBefore('public');

    }

    public function indexAction()
    {
    }

    public function sendAction()
    {
        if ($this->request->isPost() == true) {

            $name = $this->request->getPost('name', array('striptags', 'string'));
            $email = $this->request->getPost('email', 'email');
            $comments = $this->request->getPost('comments', array('striptags', 'string'));

            $contact = new Contact();
            $contact->name = $name;
            $contact->email = $email;
            $contact->comments = $comments;
            $contact->created_at = new \Phalcon\Db\RawValue('now()');
            if ($contact->save() == false) {
                foreach ($contact->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Thanks, We will contact you in the next few hours');
                return $this->dispatcher->forward(array(
                        'controller' => 'index',
                        'action' => 'index'
                    ));
            }
        }
            return $this->dispatcher->forward(array(
                        'controller' => 'contact',
                        'action' => 'index'
            ));
    }
}
