<?php



include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';


$program_id = $_POST['program'];
//$program_id = mysql_real_escape_string($program_id);
//echo $program_id;


$db = Database::get();

$query = "SELECT academic_index, active, academic_program, academic_dept_code, academic_dept, academic_degree, nebhe_ct, nebhe_ma, nebhe_nh, nebhe_ri, nebhe_vt FROM um_academic WHERE academic_index = " . $program_id  . "  LIMIT 1";

$programs = $db->query($query);

//print_r($programs);

foreach($programs as $program){
	?>
	<div style="font-size: 0.8em; float: left; width: 400px;">
		<table>
		<tr><td>Academic Program:</td><td><input type='text' id='academic_programs' value='<?PHP echo $program['academic_program']; ?>'></td></tr>
		<tr><td>Academic Dept Code:</td><td><input type='text' id='academic_dept_code' value='<?PHP echo $program['academic_dept_code']; ?>'></td></tr>
		<tr><td>Academic Department:</td><td><input type='text' id='academic_dept' value='<?PHP echo $program['academic_dept']; ?>'></td></tr>
		<tr><td>Academic Degree:</td><td><input type='text' id='academic_degree' value='<?PHP echo $program['academic_degree']; ?>'></td></tr>

	</table>
	</div>
	<div style="float: left: width: 350px; padding-top: 5px;">
		<input type='checkbox' id='nebhe_ct' <?php if($program['nebhe_ct'] == 'X') echo 'checked';?>/> NEBHE CT<br>
		<input type='checkbox' id='nebhe_ma' <?php if($program['nebhe_ma'] == 'X') echo 'checked';?>/> NEBHE MA<br>
		<input type='checkbox' id='nebhe_nh' <?php if($program['nebhe_nh'] == 'X') echo 'checked';?>/> NEBHE NH<br>
		<input type='checkbox' id='nebhe_ri' <?php if($program['nebhe_ri'] == 'X') echo 'checked';?>/> NEBHE RI<br>
		<input type='checkbox' id='nebhe_vt' <?php if($program['nebhe_vt'] == 'X') echo 'checked';?>/> NEBHE VT<br>
	</div>
	<input type='hidden' id='academic_index' value='<?PHP echo $program['academic_index']; ?>'>
	<div style="position: absolute; right: 5px; bottom: 5px;">Active: <input id="active_check" type='checkbox' <?php if($program['active'] == 'yes') echo 'checked';?>/></div>
	
	<?PHP
	//echo $program['academic_program'];
}
?>