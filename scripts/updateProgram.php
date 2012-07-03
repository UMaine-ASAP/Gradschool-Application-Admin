<?PHP
include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {

$db = Database::get();

function true_false($var){
	if($var=="true"){
		return "X";
	}
	else {
		return "";
	}
}

switch($_POST['mode']){
case("edit"):
	if($_POST['active'] == "true"){
		$active = "yes";
	}
	else{
		$active = "no";
	}

	$department = explode("-", $_POST['academic_dept']);
	$degree = explode("-", $_POST['academic_degree']);

	$description = $department[0] . "-" . $degree[0];
	$academic_plan = $department[1] . "-" . $degree[0];


	$id = $_POST['academic_index'];
	$nebhe_ct = true_false($_POST['nebhe_ct']);
	$nebhe_ma = true_false($_POST['nebhe_ma']);
	$nebhe_nh = true_false($_POST['nebhe_nh']);
	$nebhe_ri = true_false($_POST['nebhe_ri']);
	$nebhe_vt = true_false($_POST['nebhe_vt']);

	$query = "UPDATE um_academic SET active = %s, academic_program = %s, academic_plan = %s, academic_dept_code = %s, academic_dept = %s, academic_degree_heading = %s, academic_degree = %s, academic_degree_heading = %s, description_app = %s, description_list = %s, nebhe_ct = %s, nebhe_ma = %s, nebhe_nh = %s, nebhe_ri = %s, nebhe_vt = %s WHERE academic_index = %s";

	$db->iquery($query, $active, $_POST['academic_program'], $academic_plan, $department[1], $department[0], $department[2], $degree[0], $degree[1], $description, $description, $nebhe_ct, $nebhe_ma, $nebhe_nh, $nebhe_ri, $nebhe_vt, $id);
	break;
case("delete"):
	$id = $_POST['academic_index'];

	$query = "DELETE FROM um_academic WHERE academic_index = %s";
	$db->iquery($query, $id);
	break;
}
}
?>