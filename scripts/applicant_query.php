<?php 
//Tim Baker
//3/12/2011
//This script queries the user table based on POST filter values



include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

//make sure user is valid
if(check_ses_vars() != '') {
	
$db = Database::get();

function insertQueryString(&$str, $field, $var = '') {
	if($var != '') {
		$str .= ' AND $field = $var';
	}
}

function checkValue($v) { return isset($v) && $v != '';}

function get_academic_name($academic_code) {
	$db = Database::get();

	$name = $db->query("SELECT academic_dept_heading FROM um_academic WHERE academic_program = " . $academic_code);
	return $name[0];
}

//build query
$qry = "SELECT * FROM applicants WHERE 1=1 "; //use dummy value so WHERE is in starting statement -- Tim 3/12/11

/////completed/////
if(checkValue($_POST['has_been_submitted'])) {
	switch($_POST['has_been_submitted']) {
		case 'yes':
			$qry .= " AND has_been_submitted = 1";
			break;
		case 'no':
			$qry .= " AND has_been_submitted = 0";
			break;
	}
}


/////Program/////
if(checkValue($_POST['program'])) {

}

$applicants = $db->query($qry);


//merge academic data
foreach($applicants as &$applicant) {
	$result	= $db->query("SELECT * FROM appliedprograms WHERE applicant_id = %i", $applicant['applicant_id']);
	$academics = $result[0];
	$applicant = array_merge($applicant, $academics);	
}


/* =========== */
// Sort Data
//$_POST['sortby'] = 'application_submit_date';
//$_POST['sort_type'] = 'ASCD';
if($_POST['sort_by'] == '' && $_POST['sort_type'] == '' ) {
	sort_array_by_date($applicants, "application_submit_date", "ASCD");
} else {
	sort_array($applicants, $_POST['sort_by'], $_POST['sort_type']);
}




$color = 'light';
$count = 0;

foreach($applicants as $applicant) { 
	
	if( filter_set($applicant, 	  'direct', 	Array('application_fee_payment_status'))
		|| filter_set($applicant, 'contained', Array('email', 'applicant_id'))
		|| filter_set($applicant, 'direct', 	Array('student_type', 'start_semester', 'start_year', 'attendance_load', 'academic_program')) //academic fields		
		|| $_POST['given_name'] != '' && preg_match('/'.$_POST['given_name'].'/i', $applicant['family_name']) === 0 && preg_match('/'.$_POST['given_name'].'/i', $applicant['given_name']) === 0
		) continue;
		
	//check date
	
	if( 
		!check_in_range( $_POST['application_submit_date-from'], $_POST['application_submit_date-to'], $applicant['application_submit_date'] ) 
		&& $_POST['application_submit_date-to']		!=''
		&& $_POST['application_submit_date-from']	!=''
		){
		continue;
	}
		
	//check name
	if( $_POST['name'] != ''
		&& preg_match('/'.$_POST['name'].'/i', $applicant['given_name'] . $applicant['middle_name'] . $applicant['family_name']) === 0 ) continue;
	$color = $color == 'light'? 'dark' : 'light';		
	$count++;

	//If over SEARCH_LIMIT stop displaying
	if($count > $_POST['limit'] && $_POST['limit'] > 0) {
		break;
	}

?>

	<tr class='<?php echo $color;?>' id='applicant_data'>
		<td><?php echo $applicant['applicant_id']; ?></td>
		<td><?php echo $applicant['application_payment_method']; ?></td>		
		<td><?php echo ($applicant['has_been_submitted'] == 1) ? 'yes' : 'no'; ?></td>

		<!-- applicant info -->
		<td><?php 
			if($applicant['has_been_submitted'] == 1) {
				$exDOB = explode("/", $applicant['date_of_birth']);
				$newDOB = $exDOB[0].$exDOB[1].$exDOB[2];
				$pdftitle = $applicant['applicant_id']."_".$applicant['family_name']."_".$applicant['given_name']."_".$newDOB.".pdf";
				echo "<a href='getFile.php?FileName=" . $pdftitle . "&FileType=application' target='_blank'>" . $applicant['given_name'] . " " . $applicant['family_name'] . "</a>";
			} else {
				echo $applicant['given_name'] . " " . $applicant['family_name'];
			}		
 			?> 				
		</td>

		<!-- academic info -->
		<td><?php echo $applicant['academic_program'] . ' ' . get_academic_name($applicant['academic_program']); ?></td>
		<td><?php echo $applicant['application_submit_date'] ?></td>
		<td><?php echo $applicant['start_semester'] ?></td>
		<td><?php echo $applicant['start_year'] ?></td>
		
		<td><?php echo $applicant['application_fee_payment_status'] ?></td>
		<td><?php echo $applicant['student_type'] ?></td>
		<td><?php echo $applicant['attendance_load'] ?></td>
		<td>
			<?php 
				$email = $applicant['email'];
				echo "<a href='mailto:$email'>$email</a>";
			?>
		</td>
		<td><?php
			if ($applicant['essay_file_name']) {
				$exDOB = explode("/", $applicant['date_of_birth']);
				$newDOB = $exDOB[0].$exDOB[1].$exDOB[2];
				$ext = end(explode(".", $applicant['essay_file_name']));
				$filename = "essay_".$applicant['applicant_id']."_".$applicant['given_name']."_".$applicant['family_name']."_".$newDOB.".".$ext;
				echo "<a href='getFile.php?FileName=$filename&FileType=essay' target='_blank'>Essay</a>";
			}
		?>		
		</td>
		<td><?php
			if($applicant['resume_file_name']) {
				$exDOB = explode("/", $applicant['date_of_birth']);
				$newDOB = $exDOB[0].$exDOB[1].$exDOB[2];
				$ext = end(explode(".", $applicant['resume_file_name']));
				$filename = "resume_".$applicant['applicant_id']."_".$applicant['given_name']."_".$applicant['family_name']."_".$newDOB.".".$ext;
				echo "<a href='getFile.php?FileName=$filename&FileType=resume' target='_blank'>Resume</a>";
							}
		?>		
		</td>

	</tr>

<?php } 

?>
<script>
$('#display-all-results').click( function() {
	loadPage('applicants', -1);
});

$('#limit-search-results').click( function() {
	loadPage('applicants');
});

</script>
<?php
if($_POST['limit'] == -1) {
	$count_statement = "Displaying all $count results! <div><a id='limit-search-results' href='#'>Limit to $SEARCH_LIMIT Results</a></div>";
} else if($count > $_POST['limit'] && $_POST['limit'] > 0) {
	$count = $count - 1;
	$count_statement = "Over $count Results Found!<div><a id='display-all-results' href='#'>Display all results</a></div>";
} else if($count == 1) {
	$count_statement = "One Result Found!";
} else {
	$count_statement = "$count Results Found!";
}
	echo '**&&%%&&**' . $count_statement;

} else {//end check ses vars
	echo "login";
}
?>	