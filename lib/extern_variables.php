<?php
///////////////////////
// Database Settings //
///////////////////////

error_reporting(0);

//Database User
$db_user = "grad_systemI";
//Database Password
$db_pass = "TnzSnZ9zaX8p8fqG";
//Database Host
$db_host = "localhost";
//Database Table
$db_name = "grad5app";
//DES Encryption Key
//$key = "asp0df8ijapwonlkjs0a7sd092";






//////////////////////
// Website Settings //
//////////////////////

$SERVER_ROOT = "http://hoonah.asap.um.maine.edu/";
$APPMANAGER_ROOT = $SERVER_ROOT . "grad_systeminterface/";

//Session timeout in seconds
$session_timeout = 600; //10 minutes
$completed_pdf_directory = "/Library/WebServer/Documents/grad_application/pdf_export/completed_pdfs/";
$completed_essay_directory = "/Library/WebServer/Documents/grad_application/essays/";
$completed_resume_directory = "/Library/WEbServer/Documents/grad_application/essays/";
$completed_lor_directory = "/Library/WebServer/Documents/grad_application/recommendations/";

//////////////////////////
// Application Settings //
//////////////////////////

$SEARCH_LIMIT = 20;

?>
