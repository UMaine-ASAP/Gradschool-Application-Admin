<?php
include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';


//make sure user is valid
if(check_ses_vars() == '')  {
	echo "login";
	exit();
}


$db = Database::get();

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
	array('Processed', 'status', 'select', array('All', 'Processed', 'Not Processed*-*selected')),
	array('External ID', 'applicant_id', 				'text'),
	array('Online Payment', 'application_payment_method', 'select', array('-', 'PAYLATER', 'PAYNOW')),	
	array('Submitted', 	'has_been_submitted', 		'select', array('-','yes', 'no')),
	array('Applicant', 'applicant_name', 				'text'),
//	array('Last Name', 	'family_name', 				'text'),
	

	array('Program', 	'academic_program', 		'select', $academic_programs),
	array('Date Submitted', 		'application_submit_date', 	'date'),

	array('Term', 	'start_semester',   'select', array('-','SPRING', 'FALL', 'SUMMER')),
	array('Year', 		'start_year', 		'select', $years),

	
	array('Pay Status', 	'application_fee_payment_status', 	'select', array('-','Y', 'N')),
	array('Residency', 		'student_type', 					'select', array('-','IS', 'OS', 'INTL', 'NEBHE', 'CAN')),
	
	array('Acad Load', 	'attendance_load',  'select', array('-','P', 'F')),
	array('Email', 		'email', 					'text'),	
	array('Essay', 		'essay', 					'text'),
	array('Resume', 		'resume', 				'text'),	
);

createDataTableHTML('Applicants', $fields, "scripts/applicant_query.php", $_POST['limit']);

?>