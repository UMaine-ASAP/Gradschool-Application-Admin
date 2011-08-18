<?php
	include_once "libs/database.php";
	include_once "libs/variables.php";

	//*********************************************************************************************
	// Determine User and page_id
	//*********************************************************************************************
	//$user = check_ses_vars();
	//$user = ($user)?$user:header("location:pages/login.php");
	
	//Eventually have it find first not completed page;
	//$page_id = isset($_GET['form_id'])?$_GET['form_id']:2; //2 is page one


	//*********************************************************************************************
	// Open database link
	//*********************************************************************************************
	$db = new Database();
	$db->connect();
	$db->iquery("INSERT INTO UM_ACADEMIC(academic_program,	academic_plan,	academic_dept_code,	academic_dept,	academic_dept_heading,	academic_degree,	academic_degree_heading,	description_app,	description_list,	nebhe_ct,	nebhe_ma,	nebhe_nh,	nebhe_ri,	nebhe_vt) VALUES ('MATPhD','MAT-PHD', 'MAT', 'Mathematics Department', 'The Mathematics', 'PHD', 'PhD', 'Mathematics-PHD', 'Mathematics-PHD', '','','','','');");
	/*
	$test_query = "SELECT * FROM UM_ACADEMIC";
	$result = $db->query($test_query);
	$result = $result[0];
		foreach($result as $id_key => $value) {
			if(!is_numeric($id_key)) 				//$page1_replace[strtoupper($id_key)] = $value;
				echo "<p>" . $id_key . "  " . $value . "</p>";
		}
	
	//print_r($result);
*/	
	$db->close();