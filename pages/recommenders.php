<?php
include_once '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {


$db = Database::get();

$fields = array(
	array('Date Submitted', 	 'recommender_submit_date', 	'date'),
	array('Applicant ID', 		 'applicant_id', 			'text'),
	array('Applicant Name', 	 'applicant_name', 			'text'),
	
	array('Recommender Name', 'reference_name',		'text'),
	
	array('Recommender Email', 		 'reference_email', 'text'),
);

createDataTableHTML('Recommenders', $fields, $GLOBALS['APPMANAGER_ROOT'] . "scripts/recommenders_query.php", $_POST['limit']);


} else {
	echo 'login';
}
?>