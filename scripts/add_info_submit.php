<?php
	include_once "../lib/database.php";
	include_once "../lib/variables.php";

	
//make sure user is valid
if(check_ses_vars() != '') {
	
	
	// upper-cased those values
	$_POST['academic_program']	 = strtoupper($_POST['academic_program']);
	$_POST['academic_degree']	 = strtoupper($_POST['academic_degree']);
	
	//generate other values
	$_POST['academic_plan']		 = $_POST['academic_dept_code'] . $_POST['academic_degree'];
	
	$values = explode('*', $_POST['academic_dept_heading_and_code']);
	

	$_POST['academic_dept_code'] = $values[0];
	$_POST['academic_dept_heading'] = $values[1];
	
	//need to match values from table
	$_POST['academic_degree_heading'] = $_POST['academic_degree'];
	$_POST['academic_dept'] = $_POST['academic_dept_heading'];  // need to fix length issue
	$_POST['description_app'] = $_POST['academic_dept'];
	$_POST['description_list'] = $_POST['academic_dept'];

	
	
	//$_POST['academic_program'] = strtoupper($_POST['academic_program']);
	
	// initialize the checkbox variables
	// initialized function
	function defineCheckBox(&$x) {
		if ( !isset($x) ) $x = '';
		else $x = 'X';
	}
	definecheckBox($_POST['nebhe_ct']);
	definecheckBox($_POST['nebhe_nh']);
	definecheckBox($_POST['nebhe_ma']);
	definecheckBox($_POST['nebhe_ri']);
	definecheckBox($_POST['nebhe_vt']);
		if ( ($_POST['academic_program'] == ''))
			echo "academic_program";
		if($_POST['academic_dept_code'] == '')
			echo "academic_dept_code";
		if($_POST['academic_dept'] == '')
			echo "academic_dept";
		if($_POST['academic_dept_heading'] == '')
			echo "academic_dept_heading";
		if($_POST['academic_degree'] == '')
			echo "academic_degree";

	
	
	// the problem here.
	function checkRequired () {
		if ( ($_POST['academic_program'] == '')  || ($_POST['academic_dept_code'] == '') || ($_POST['academic_dept'] == '') || ($_POST['academic_dept_heading'] == '') || ($_POST['academic_degree'] == '') )  {
			echo "NOTE: marked items are required."; 
			return "error";
			}
		//else submit();
		
	}
/*	
	checkRequired ($_POST['academic_code']);
	checkRequired ($_POST['academic_dept']);
	checkRequired ($_POST['academic_dept_heading']);
	checkRequired ($_POST['academic_program']);
	checkRequired ($_POST['academic_degree']);
	checkRequired ($_POST['academic_app']);
	checkRequired ($_POST['academic_list']);
*/	

	function modifyTheRest() {
		if (isset ($_POST['academic_plan'])) {
			$_POST['academic_plan'] = $_POST['academic_program'].'-'.$_POST['academic_dept_code'];
			}
		//else 	return "error";
		
		if (isset ($_POST['description_app'])) {
			$_POST['description_app'] = $_POST['academic_dept'].'-'.$_POST['academic_degree'];
			}
		//else 	return "error";
			
		switch ($_POST['academic_degree']) {
			case "PHD":
				$_POST['academic_degree_heading'] = "PhD";
				break;
			case "MED":
				$_POST['academic_degree_heading'] = "MEd";
				break;
			//default: 
				//return "error";
		}
		/*
		$_POST['academic_program'],$_POST['academic_plan'],$_POST['academic_dept_code'],
		$_POST['academic_dept'],
		$_POST['academic_dept_heading'],$_POST['academic_degree'],$_POST['academic_degree_heading']
		$_POST['description_app'],$_POST['description_list']
		*/
	}
	
	modifyTheRest();
	
	if ((checkRequired() == "error") ) 
		echo "submit failed!";
	else submit();

	
	function submit () {
		$db = new Database();
		$db->connect();
		$qry = "INSERT INTO UM_ACADEMIC(academic_program,academic_plan,academic_dept_code,academic_dept,academic_dept_heading,academic_degree,academic_degree_heading,	description_app,description_list,nebhe_ct,nebhe_ma,nebhe_nh,nebhe_ri,nebhe_vt) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);";
		$db->iquery($qry, $_POST['academic_program'],$_POST['academic_plan'],$_POST['academic_dept_code'],$_POST['academic_dept'],$_POST['academic_dept_heading'],$_POST['academic_degree'],$_POST['academic_degree_heading'],$_POST['description_app'],$_POST['description_list'],$_POST['nebhe_ct'],$_POST['nebhe_ma'],$_POST['nebhe_nh'],$_POST['nebhe_ri'],$_POST['nebhe_vt']);
		$db->close();
		echo "submit succeed";
	}

	
} //end user check	
?>
