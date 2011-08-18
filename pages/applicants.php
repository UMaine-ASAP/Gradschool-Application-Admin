<?php
include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';


//make sure user is valid
if(check_ses_vars() != '') {


$db = Database::get();
$applicants = $db->query("SELECT * FROM applicants ORDER BY application_submit_date");

//$programs = $db->query("SELECT * FROM um_academic");
//foreach($programs as $program) {
//$name = $program['academic_dept_heading'] . " " . $program['academic_degree'];
$result = $db->query("SELECT DISTINCT academic_program, academic_dept_heading, academic_degree FROM um_academic ORDER BY academic_program");
$academic_programs = array('-'=>'-', ''=>'');
foreach($result as $r) {
//	array_push($academic_programs, $r['academic_program']);
	$academic_programs[$r['academic_program']] = $r['academic_program'] . ' ' . $r['academic_dept_heading'];
}

//build years
$result = $db->query("SELECT DISTINCT start_year from appliedprograms ORDER BY start_year ASC");
$years = array('-', '');
foreach($result as $r) {
	if($r['start_year'] != '')
		array_push($years, $r['start_year']);
}

//format: {
//	Array('output-name', 'filter-name', 'text'),
//	Array('output-name', 'filter-name', 'select', data),
//}
$fields = array(
	array('External ID','applicant_id', 				'text'),
	array('Completed', 	'has_been_submitted', 		'select', array('-','yes', 'no')),
	array('First Name', 'given_name', 				'text'),
	array('Last Name', 	'family_name', 				'text'),
	

	array('Program', 	'academic_program', 		'select', $academic_programs),
	array('Date Completed', 		'application_submit_date', 	'date'),

	array('Term', 	'start_semester',   'select', array('-','SPRING', 'FALL', 'SUMMER')),
	array('Year', 		'start_year', 		'select', $years),

	
	array('Pay Status', 	'application_fee_payment_status', 	'select', array('-','Y', 'N')),
	array('Residency', 		'student_type', 					'select', array('-','IS', 'OS', 'INTL', 'NEBHE', 'CAN')),
	
	array('Acad Load', 	'attendance_load',  'select', array('-','P', 'F')),
	array('Email', 		'email', 					'text'),	
	array('Application', 		'application', 		'text'),
	array('Essay', 		'essay', 					'text'),
	array('Resume', 		'resume', 				'text')
	
);

createDataTableHTML('Applicants', $fields, "scripts/applicant_query.php", $_POST['limit']);


} else {
	echo 'login';
}
?>