<?php 



include_once 'lib/variables.php';

include_once 'lib/core.php';



//make sure user is valid

if(check_ses_vars() != '') {

	$_GET['FileName'] = str_replace("..", "", $_GET['FileName']);

	// Build File

	if ($_GET['FileType'] == 'application') {

		if ( file_exists( $GLOBALS['completed_pdf_directory'] . $_GET['FileName'] ) ) {

			$file = $GLOBALS['completed_pdf_directory'] . $_GET['FileName'];	

		}

		else if ( file_exists( $GLOBALS['completed_pdf_archive_directory'] . $_GET['FileName'] ) ) {

			$file = $GLOBALS['completed_pdf_archive_directory'] . $_GET['FileName'];

		}

		else {

			header("HTTP/1.0 404 Not Found");

			exit;

		}

	}

	else if($_GET['FileType'] == 'essay') {

		if ( file_exists( $GLOBALS['completed_essay_directory'] . $_GET['FileName'] ) ) {

			$file = $GLOBALS['completed_essay_directory'] . $_GET['FileName'];

		}

		else {

			header("HTTP/1.0 404 Not Found");

			exit;

		}

	} else if($_GET['FileType'] == 'resume') {

		if ( file_exists( $GLOBALS['completed_resume_directory'] . $_GET['FileName'] ) ) {

			$file = $GLOBALS['completed_resume_directory'] . $_GET['FileName'];

		}

                else {

                        header("HTTP/1.0 404 Not Found");

                        exit;

                }

	} else if($_GET['FileType'] == 'LOR') {

		if ( file_exists( $GLOBALS['completed_lor_directory'] . $_GET['FileName'] ) ) {

			$file = $GLOBALS['completed_lor_directory'] . $_GET['FileName'];

		}

                else {

                        header("HTTP/1.0 404 Not Found");

                        exit;

                }

	}

	else {

		header("HTTP/1.0 404 Not Found");

		exit;

	}

	

	// Build Content-Type

	header("Content-Type:" . mime_content_type($_GET['FileName']) );

	

	header("Content-Length: " . filesize($file));

	readfile($file);



}



echo "Invalid Session";

?>

