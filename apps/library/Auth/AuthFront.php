<?php namespace Eduapps\Auth;

use Phalcon\Mvc\User\Component,
	Eduapps\Frontend\Models\Users,
	Eduapps\Frontend\Models\RememberTokens,
	Eduapps\Frontend\Models\SuccessLogins,
	Eduapps\Frontend\Models\FailedLogins;

/**
 * Eduapps\Auth\Auth
 *
 * Manages Authentication/Identity Management in Eduapps
 */
class AuthFront extends Component
{

	/**
	 * Checks the user credentials
	 *
	 * @param array $credentials
	 * @return boolan
	 */
	public function check($credentials)
	{

		//Check if the user exist
		$user = Users::findFirstByEmail($credentials['email']);
		//print_r($user);
		if ($user == false) {
			$this->registerUserThrottling(0);
			throw new Exception('Wrong username/password combination');
		}

		//Check the password
		if ($this->security->checkHash($credentials['password'], $user->password)==false) {
			$this->registerUserThrottling($user->id);
			throw new Exception('Wrong username/password combination');
		}

		//Check if the user was flagged
		$this->checkUserFlags($user);

		//Register the successful login
		$this->saveSuccessLogin($user);
		
		//Check if the remember me was selected
		if (isset($credentials['remember'])) {
			$this->createRememberEnviroment($user);
		}

		$this->session->set('auth-front', array(
			'id' => $user->id,
			'username' => $user->username,
			'profile' => $user->profile->name
		));
	}

	/**
	 * Creates the remember me environment settings the related cookies and generating tokens
	 *
	 * @param Eduapps\Models\Users $user
	 */
	public function saveSuccessLogin($user)
	{
		$successLogin = new SuccessLogins();
		$successLogin->usersId = $user->id;
		$successLogin->ipAddress = $this->request->getClientAddress();
		$successLogin->userAgent = $this->request->getUserAgent();
		if (!$successLogin->save()) {
			$messages = $successLogin->getMessages();
			throw new Exception($messages[0]);
		}
	}

	/**
	 * Implements login throttling
	 * Reduces the efectiveness of brute force attacks
	 *
	 * @param int $userId
	 */
	public function registerUserThrottling($userId)
	{
		$failedLogin = new FailedLogins();
		$failedLogin->usersId = $userId;
		$failedLogin->ipAddress = $this->request->getClientAddress();
		$failedLogin->attempted = time();
		$failedLogin->save();

		$attempts = FailedLogins::count(array(
			'ipAddress = ?0 AND attempted >= ?1',
			'bind' => array(
				$this->request->getClientAddress(),
				time() - 3600 * 6
			)
		));

		switch ($attempts) {
			case 1:
			case 2:
				// no delay
				break;
			case 3:
			case 4:
				sleep(2);
				break;
			default:
				sleep(4);
				break;
		}

	}

	/**
	 * Creates the remember me environment settings the related cookies and generating tokens
	 *
	 * @param Eduapps\Models\Users $user
	 */
	public function createRememberEnviroment(Users $user)
	{

		$userAgent = $this->request->getUserAgent();
		$token = md5($user->username . $user->password . $userAgent);

		$remember = new RememberTokens();
		$remember->usersId = $user->id;
		$remember->token = $token;
		$remember->userAgent = $userAgent;

		if ($remember->save() != false) {
			$expire = time() + 86400 * 8;
			$this->cookies->set('RMU', $user->id, $expire);
			$this->cookies->set('RMT', $token, $expire);
		}

	}

	/**
	 * Check if the session has a remember me cookie
	 *
	 * @return boolean
	 */
	public function hasRememberMe()
	{
		return $this->cookies->has('RMU');
	}

	/**
	 * Logs on using the information in the coookies
	 *
	 * @return Phalcon\Http\Response
	 */
	public function loginWithRememberMe()
	{
		$userId = $this->cookies->get('RMU')->getValue();
		$cookieToken = $this->cookies->get('RMT')->getValue();

		$user = Users::findFirstById($userId);
		if ($user) {

			$userAgent = $this->request->getUserAgent();
			$token = md5($user->email . $user->password . $userAgent);

			if ($cookieToken == $token) {

				$remember = RememberTokens::findFirst(array(
					'usersId = ?0 AND token = ?1',
					'bind' => array($user->id, $token)
				));
				if ($remember) {

					//Check if the cookie has not expired
					if ((time() - (86400 * 8)) < $remember->createdAt) {

						//Check if the user was flagged
						$this->checkUserFlags($user);

						//Register identity
						$this->session->set('auth-front', array(
							'id' => $user->id,
							'username' => $user->username,
							'profile' => $user->profile->name
						));

						//Register the successful login
						$this->saveSuccessLogin($user);

						return $this->response->redirect('user/');
					}
				}

			}

		}

		$this->cookies->get('RMU')->delete();
		$this->cookies->get('RMT')->delete();

		return $this->response->redirect('admin/');
	}

	/**
	 * Checks if the user is banned/inactive/suspended
	 *
	 * @param Eduapps\Models\Users $user
	 */
	public function checkUserFlags(Users $user)
	{
		if ($user->active <> 'Y')  {
			throw new Exception('The user is inactive');
		}

		if ($user->banned <> 'N')  {
			throw new Exception('The user is banned');
		}

		if ($user->suspended <> 'N')  {
			throw new Exception('The user is suspended');
		}
	}

	/**
	 * Returns the current identity
	 *
	 * @return array
	 */
	public function getIdentity()
	{
		return $this->session->get('auth-front');
	}

	/**
	 * Returns the current identity
	 *
	 * @return string
	 */
	public function getName()
	{
		$identity = $this->session->get('auth-front');
		return $identity['username'];
	}

	/**
	 * Removes the user identity information from session
	 */
	public function remove()
	{
		if ($this->cookies->has('RMU')) {
			$this->cookies->get('RMU')->delete();
		}
		if ($this->cookies->has('RMT')) {
			$this->cookies->get('RMT')->delete();
		}

		$this->session->remove('auth-front');
	}

	/**
	 * Auths the user by his/her id
	 *
	 * @param int $id
	 */
	public function authUserById($id)
	{
		$user = Users::findFirstById($id);
		if ($user == false) {
			throw new Exception('The user does not exist');
		}

		$this->checkUserFlags($user);

		$this->session->set('auth-front', array(
			'id' => $user->id,
			'username' => $user->username,
			'profile' => $user->profile->name
		));

	}

	/**
	 * Get the entity related to user in the active identity
	 *
	 * @return \Eduapps\Models\Users
	 */
	public function getUser()
	{
		$identity = $this->session->get('auth-front');
		if (isset($identity['id'])) {

			$user = Users::findFirstById($identity['id']);
			if ($user == false) {
				throw new Exception('The user does not exist');
			}

			return $user;
		}

		return false;
	}

}