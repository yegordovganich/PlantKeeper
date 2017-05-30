<?php
	// If this file exists it will be used by datawarputil.php to check users permissions,
	// at least administrative OAuth functions will be protected:
	// to use createInvitationKey() your users should have role with 'invite_user' permission
	// to use createNewUser()/createNewUserWithAvatar() your users should have role with 'create_user' permission
	// to use deleteRegisteredUser() your users should have role with 'delete_user' permission
	// to use changeUserPassword() your users should have role with 'change_user_password' permission
	// to use sendSimpleOauthMail() your users should have role with 'send_mail' permission
	// to use createJWT() your users should have role with 'createjwt_permission' permission

	// Would be great if you protected other yours requests not only by UI but with check permissions mechanizm too.
	// Please read how to do that here flow/doc/datawarp.html and here substantiate/readme.txt.

	// This very checkUserPermissions() based on standart admin_panel tables. If you have your own access_level mechanizm - modify this 
	// checkUserPermissions() in proper way.

	// If your application doesn't need any restrictions - just delete this file from yourApplication/www/php folder.

function checkUserPermissions($permissions = array()) {
	if (!empty($permissions)) {
		$token = decodeJWT(getParameter('jwt'));
		$emailFromJWT = $token['email'];
		$idFromJWT = $token['id'];
		$appNameFromJWT = $token['iss'];
		$INClause = '\''. implode('\', \'', $permissions) . '\'';
		$sql = "SELECT users.`id` FROM users 
		INNER JOIN users_product_roles ON users_product_roles.`user_id` = users.`id`
		INNER JOIN product_roles ON product_roles.`id` = users_product_roles.`role_id`
		INNER JOIN product_roles_permissions ON product_roles_permissions.`role_id` = product_roles.`id`
		INNER JOIN product_permissions ON product_permissions.`id` = product_roles_permissions.`permission_id`
		WHERE users.`email` = '$emailFromJWT' AND application = '$appNameFromJWT' 
		AND product_permissions.`name` IN (" . $INClause . ")";
		$result = exec_query("", $sql, array());
		if (empty($result) || $idFromJWT != $result[0][0]) {
			return false;
		} else {
			return true;
		}
	} else {
		return true;
	}
}
?>