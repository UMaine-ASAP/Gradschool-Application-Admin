<?php

include '../lib/variables.php';
include '../lib/database.php';
include '../lib/core.php';

if( isset($_POST['username']) && isset($_POST['password']) ) {

	$db = Database::get();
	$r = $db->query("SELECT id, password FROM admin WHERE username = %s", $_POST['username']);
	$result = $r[0];
	if( $result != null && $result['password'] == sha1($_POST['password']) ) {
		user_login($result['id']);
		echo 'success';
	} else { 
		echo 'failure';
	}


} else {
	echo 'failure';
}
?>