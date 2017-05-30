<?php
	/**
	* HybridAuth
	* http://hybridauth.sourceforge.net | http://github.com/hybridauth/hybridauth
	* (c) 2009-2015, HybridAuth authors | http://hybridauth.sourceforge.net/licenses.html
	*/

	// ----------------------------------------------------------------------------------------
	//	HybridAuth Config file: http://hybridauth.sourceforge.net/userguide/Configuration.html
	// ----------------------------------------------------------------------------------------
	include 'datawarputil.php';

	$oauthSettings = array(
		'appEmail' => "plantkeeper", //can be modified without any harm to authentication 
		'login' => "auth@area9.dk", 
		'pass' => "M1ner@lo4ka", 
		'smtpName' => "smtp.gmail.com", 
		'smtpPort' => 465,
		'appName' => "plantkeeper", //used for proper authentication set up it only once. Do not change during using.
		'ssl' => (!empty($_SERVER['HTTPS']) && !stristr($_SERVER['HTTPS'], 'off')), // Set it true if you use https://
		'attempts' => 0, // It will limit attempts for log in, set it equal 0 to unlimit
		'actives' => 0, // It will limit number of logged in devices, set it equal 0 to unlimit
		'oneTimePassword' => false,
		'twoFactorAuthentication' => false,
		'twoFactorApiKey' => '', //use sms sender api key
		'twoFactorServerAddress' => 'https://mm.inmobile.dk'
		);

	$hybrid = array(
			"base_url" => (($oauthSettings['ssl']) ? "https://".$_SERVER['SERVER_NAME'] : "http://".$_SERVER['SERVER_NAME'].":".$_SERVER['SERVER_PORT']).substr($_SERVER['REQUEST_URI'], 0, strripos($_SERVER['REQUEST_URI'], "login.php")),

			"providers" => array (
				// openid providers
				"OpenID" => array (
					"enabled" => true
				),

				"Yahoo" => array (
					"enabled" => true,
					"keys"    => array ( "key" => "", "secret" => "" ),
				),

				"AOL"  => array (
					"enabled" => true
				),
	// settings for Google http://hybridauth.sourceforge.net/userguide/IDProvider_info_Google.html
				"Google" => array (
					"enabled" => true,
					"keys"    => array ( "id" => "", "secret" => "" ),
					"redirect_uri" => (($oauthSettings['ssl']) ? "https://".$_SERVER['SERVER_NAME'] : "http://".$_SERVER['SERVER_NAME'].":".$_SERVER['SERVER_PORT']).substr($_SERVER['REQUEST_URI'], 0, strripos($_SERVER['REQUEST_URI'], "login.php"))."index.php?hauth.done=Google"
				),
	// settings for Facebook http://hybridauth.sourceforge.net/userguide/IDProvider_info_Facebook.html
				"Facebook" => array (
					"enabled" => true,
					"keys"    => array ( "id" => "", "secret" => "" ),
					"scope"   => "email, user_about_me, user_birthday, user_hometown",
					"trustForwarded" => true
				),

				// windows live
				"Live" => array (
					"enabled" => true,
					"keys"    => array ( "id" => "", "secret" => "" )
				),

				"LinkedIn" => array (
					"enabled" => true,
					"keys"    => array ( "key" => "", "secret" => "" )
				),

				"Foursquare" => array (
					"enabled" => true,
					"keys"    => array ( "id" => "", "secret" => "" )
				),
			),

			// If you want to enable logging, set 'debug_mode' to true.
			// You can also set it to
			// - "error" To log only error messages. Useful in production
			// - "info" To log info and error messages (ignore debug messages)
			"debug_mode" => false,

			// Path to file writable by the web server. Required if 'debug_mode' is not false
			"debug_file" => "",
		);

?>