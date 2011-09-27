<?php

include '../lib/variables.php';
include '../lib/database.php';
include '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {
	user_logout();
	header('Location:' . $GLOBALS['APPMANAGER_ROOT'] . 'login.php');
}

?>