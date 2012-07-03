<script>
$(document).ready(function() {
	$('select#academic_dept').selectToAutocomplete();
});
</script>
<?php



include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';


$program_id = $_POST['program'];
//$program_id = mysql_real_escape_string($program_id);
//echo $program_id;

$db = Database::get();

$query = "SELECT academic_index, active, academic_program, academic_dept_code, academic_dept, academic_degree, nebhe_ct, nebhe_ma, nebhe_nh, nebhe_ri, nebhe_vt FROM um_academic WHERE academic_index = %s LIMIT 1";

$programs = $db->query($query, $program_id);

$academic_dept_heading_and_code = $db->query('SELECT DISTINCT academic_dept, academic_dept_code, academic_dept_heading FROM um_academic ORDER BY academic_dept');
$degrees = $db->query('SELECT DISTINCT academic_degree, academic_degree_heading FROM um_academic ORDER BY academic_degree ');

foreach($programs as $program){
	?>
	<div style="font-size: 0.8em; float: left; width: 500px;">
		<table>
		<tr><td>Academic Program:</td><td><input type='text' class="program_data" id='academic_programs' value='<?PHP echo $program['academic_program']; ?>'></td></tr>
		<tr><td>Academic Department:</td><td>
		<select id='academic_dept' class="program_data">
		<?PHP
		foreach($academic_dept_heading_and_code as $dept){
			echo "<option value=\"" . $dept[0] . "-" . $dept[1] . "-" . $dept[2] . "\" ";
			if($dept[0] == $program['academic_dept']){
				echo "selected";
			}
			echo ">". $dept[0] ."</option>";
		}
		?>
		</select>
		</td></tr>
		<tr><td>Academic Degree:</td><td>
		<select id='aca_deg' class="program_data">
		<?PHP
		foreach($degrees as $degree){
			echo "<option value=\"" . $degree[0] . "-" . $degree[1] . "\" ";
			if($degree[0] == $program['academic_degree']){
				echo "selected";
			}
			echo ">". $degree[0] . "</option>";
		}
		?>
		</select>
		</td></tr>

	</table>
	</div>
	<div style="float: left: width: 350px; padding-top: 5px;">
		<input type='checkbox' class="program_data" id='nebhe_ct' <?php if($program['nebhe_ct'] == 'X') echo 'checked';?>/> NEBHE CT<br>
		<input type='checkbox' class="program_data" id='nebhe_ma' <?php if($program['nebhe_ma'] == 'X') echo 'checked';?>/> NEBHE MA<br>
		<input type='checkbox' class="program_data" id='nebhe_nh' <?php if($program['nebhe_nh'] == 'X') echo 'checked';?>/> NEBHE NH<br>
		<input type='checkbox' class="program_data" id='nebhe_ri' <?php if($program['nebhe_ri'] == 'X') echo 'checked';?>/> NEBHE RI<br>
		<input type='checkbox' class="program_data" id='nebhe_vt' <?php if($program['nebhe_vt'] == 'X') echo 'checked';?>/> NEBHE VT<br>
	</div>
	<input type='hidden' class="program_data" id='academic_index' value='<?PHP echo $program['academic_index']; ?>'>
	<div style="position: absolute; right: 5px; bottom: 5px;">Active: <input id="active_check" type='checkbox' <?php if($program['active'] == 'yes') echo 'checked';?>/></div>
	
	<?PHP
	//echo $program['academic_program'];
}
?>
