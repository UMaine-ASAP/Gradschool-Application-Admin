<?php
include_once '../lib/variables.php';
include_once '../lib/database.php';

include_once '../lib/core.php';


//make sure user is valid
if(check_ses_vars() != '') {


$academic_programs  	= 	getDistinct('academic_program', 'um_academic');
$academic_dept_code 	= 	getDistinct('academic_dept_code', 'um_academic');
$academic_dept_heading 	= 	getDistinct('academic_dept', 'um_academic');
$academic_degree		= 	getDistinct('academic_degree', 'um_academic');


$fields = array(
	array('Active', 'active', 'select', array('-', 'yes','no')),
	array('Academic Program', 	'academic_program', 	'text'),//'select', $academic_programs),
	array('Academic Dept Code', 'academic_dept_code', 	'text'),//''select', $academic_dept_code),
	array('Academic Dept', 		'academic_dept', 		'text'),//''select', $academic_dept_heading),
	array('Academic Degree', 	'academic_degree', 		'select', $academic_degree),

	array('NEBHE CT', 		'nebhe_ct', 	'select', array('-','', 'X')),
	array('NEBHE MA', 		'nebhe_ma', 	'select', array('-','', 'X')),
	array('NEBHE NH', 		'nebhe_nh', 	'select', array('-','', 'X')),
	array('NEBHE RI', 		'nebhe_ri', 	'select', array('-','', 'X')),
	array('NEBHE VT', 		'nebhe_vt', 	'select', array('-','', 'X'))
);

createDataTableHTML('Programs', $fields, $GLOBALS['APPMANAGER_ROOT'] . "scripts/programs_query.php", $_POST['limit']);


include 'add_info.php';


} else {
	echo 'login';
}
?>
