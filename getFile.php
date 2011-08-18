<?php 

include_once 'lib/variables.php';
//include_once 'lib/database.php';
include_once 'lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {

	// Build File
	if ($_GET['FileType'] == 'application') {
		$file = $GLOBALS['completed_pdf_directory'] . $_GET['FileName'];	
	} else if($_GET['FileType'] == 'essay') {
		$file = $GLOBALS['completed_essay_directory'] . $_GET['FileName'];
	} else if($_GET['FileType'] == 'resume') {
		$file = $GLOBALS['completed_resume_directory'] . $_GET['FileName'];
	}
	
	// Build Content-Type
	header("Content-Type:" . mime_content_type($_GET['FileName']) );
	
	header("Content-Length: " . filesize($file));
	readfile($file);

}

?>