<?php

include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {
	user_logout();
	header('Location:' . $GLOBALS['APPMANAGER_ROOT'] . 'login.php');
}

?>