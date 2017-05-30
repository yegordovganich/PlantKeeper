<?php
// This file is generated, but meant to be hacked by you, my friendly and excellent programmer.
include "../oauth/utils/oauthutil.php";
include_once 'datawarputil.php';

$operation = getParameter('operation');

switch ($operation) {
case 'getTimeStamp':
	$timestampFile = $datafolder . 'timestamp.txt';
	if (file_exists($timestampFile)) {
		$timestamp = file_get_contents($timestampFile);
 		printOkAndJson($timestamp);
 	} else {
 		echo 'Timestamp file does not exist';
 	}
    break;
default:
    echo 'Unknown operation: ' . $operation;
    break;
}
?>