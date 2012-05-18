<?php
	include_once "../lib/variables.php";
	include_once "../lib/database.php";
	include_once '../lib/core.php';

$db = Database::get();

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
	
	// initialize the checkbox variables
	// initialized function
	function true_false($var){
		if($var=="true"){
			return "X";
		}
		else {
			return "";
		}
	}
	$nebhe_ct = true_false($_POST['nebhe_ct']);
	$nebhe_ma = true_false($_POST['nebhe_ma']);
	$nebhe_nh = true_false($_POST['nebhe_nh']);
	$nebhe_ri = true_false($_POST['nebhe_ri']);
	$nebhe_vt = true_false($_POST['nebhe_vt']);
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
			case ("PHD"):
				$_POST['academic_degree_heading'] = "PhD";
				break;
			case ("MED"):
				$_POST['academic_degree_heading'] = "MEd";
				break;
			//default: 
				//return "error";
		}
	}

	modifyTheRest();

	if (checkRequired() == "error"){
		echo "submit failed!";
	} 
	else {
		$qry = "INSERT INTO um_academic (academic_program,academic_plan,academic_dept_code,academic_dept,academic_dept_heading,academic_degree,academic_degree_heading,	description_app,description_list,nebhe_ct,nebhe_ma,nebhe_nh,nebhe_ri,nebhe_vt) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);";
		$db->iquery($qry, $_POST['academic_program'],$_POST['academic_plan'],$_POST['academic_dept_code'],$_POST['academic_dept'],$_POST['academic_dept_heading'],$_POST['academic_degree'],$_POST['academic_degree_heading'],$_POST['description_app'],$_POST['description_list'],$nebhe_ct, $nebhe_ma, $nebhe_nh, $nebhe_ri, $nebhe_vt);
		echo "submit succeed";
	}
} //end user check	
?>
