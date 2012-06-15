<?PHP
include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

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

	$query = "UPDATE um_academic SET active = '$active', academic_program = '{$_POST['academic_program']}', academic_plan = '{$academic_plan}', academic_dept_code = '{$department[1]}', academic_dept = '{$department[0]}', academic_dept_heading = '{$department[2]}', academic_degree = '{$degree[0]}', academic_degree_heading = '{$degree[1]}', description_app = '{$description}', description_list = '{$description}', nebhe_ct = '$nebhe_ct', nebhe_ma = '$nebhe_ma', nebhe_nh = '$nebhe_nh', nebhe_ri = '$nebhe_ri', nebhe_vt = '$nebhe_vt' WHERE academic_index = '$id'";

	echo $query;

	$db->iquery($query);
	break;
case("delete"):
	$id = $_POST['academic_index'];

	$query = "DELETE FROM um_academic WHERE academic_index = '$id'";
	$db->iquery($query);
	break;
}
?>