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



if($_POST['active'] == "true"){
	$active = "yes";
}
else{
	$active = "no";
}

$id = $_POST['academic_index'];
$nebhe_ct = true_false($_POST['nebhe_ct']);
$nebhe_ma = true_false($_POST['nebhe_ma']);
$nebhe_nh = true_false($_POST['nebhe_nh']);
$nebhe_ri = true_false($_POST['nebhe_ri']);
$nebhe_vt = true_false($_POST['nebhe_vt']);

$query = "UPDATE um_academic SET active = '$active', academic_program = '{$_POST['academic_program']}', academic_dept_code = '{$_POST['academic_dept_code']}', academic_dept = '{$_POST['academic_dept']}', academic_degree = '{$_POST['academic_degree']}', nebhe_ct = '$nebhe_ct', nebhe_ma = '$nebhe_ma', nebhe_nh = '$nebhe_nh', nebhe_ri = '$nebhe_ri', nebhe_vt = '$nebhe_vt' WHERE academic_index = '$id'";

echo $query;

$db->iquery($query);

?>