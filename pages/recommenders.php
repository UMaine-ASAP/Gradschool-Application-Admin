<?php
include_once '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {


$db = Database::get();
$applicants = $db->query("SELECT * FROM applicants");

$fields = array(
	array('Submitted', 	 'submitted', 		'select', array('-', 'yes', 'no')),
	array('Applicant ID', 		 'applicant_id', 			'text'),
	array('Applicant Name', 	 'applicant_name', 			'text'),
	
	array('Recommender First', 'reference_first',		'text'),
	array('Recommender Last', 'reference_last',		'text'),
	
	array('Email', 		 'reference_email', 'text'),
	array('Letters', 	 'letter', 			'text')	
);

createDataTableHTML('Recommenders', $fields, "scripts/recommenders_query.php", $_POST['limit']);


} //end user check

?>
