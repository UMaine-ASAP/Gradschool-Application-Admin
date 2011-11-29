<?php 
//Tim Baker
//3/12/2011
//This script queries the user table based on POST filter values

include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';
include_once '../lib/pagination.php';

//make sure user is valid
if(check_ses_vars() == '')  {
	echo "login";
	exit();
}

function get_academic_name($academic_code) {
	$db = Database::get();

	$name = $db->query("SELECT academic_dept_heading FROM um_academic WHERE academic_program = %s", $academic_code);
	return $name[0];
}

// ====== //
// Build Query

$db = Database::get();

$query = "SELECT * FROM applicant_academic WHERE 1 "; //Add dummy value
$query_cond = "";

//Filters
if(checkValue($_POST['has_been_submitted'])) {
	switch($_POST['has_been_submitted']) {
		case 'yes':
			$query_cond .= " AND has_been_submitted = 1";
			break;
		case 'no':
			$query_cond .= " AND has_been_submitted = 0";
			break;
	}
}

$query_cond .= buildQuery('direct', "application_payment_method");
$query_cond .= buildQuery('direct', "application_fee_payment_status");
$query_cond .= buildQuery('direct', "student_type");
$query_cond .= buildQuery('direct', "start_semester");
$query_cond .= buildQuery('direct', "start_year");
$query_cond .= buildQuery('direct', "attendance_load");
$query_cond .= buildQuery('direct', "academic_program");
$query_cond .= buildQuery('contained', "applicant_name");
$query_cond .= buildQuery('contained', "email");
$query_cond .= buildQuery('contained', "applicant_id");

//Deal with date
if( $_POST['application_submit_date-from'] != '' && $_POST['application_submit_date-to'] != '') {
	$date_from = mysql_real_escape_string($_POST['application_submit_date-from']);
	$date_to   = mysql_real_escape_string($_POST['application_submit_date-to']);	
	$query_cond .= "AND application_submit_date >= '$date_from' AND application_submit_date < '$date_to'";
}

//Order Data
if($_POST['sort_by'] == '' && $_POST['sort_type'] == '' ) {
	$query_cond .= " ORDER BY application_submit_date DESC ";
} else {
	$sort_by   = mysql_real_escape_string($_POST['sort_by']);
	$sort_type = mysql_real_escape_string($_POST['sort_type']);	
	$query_cond .= " ORDER BY $sort_by $sort_type";
}

//limit display and deal with pages
$page = (int) (!isset($_POST["page"]) ? 1 : $_POST["page"]);
$limit = 20;
$startpoint =  ($page * $limit) - $limit ;

$query_limit = " LIMIT $startpoint, $limit ";


//print "<tr><td>$query $query_cond</td></tr>";

$applicants = $db->query($query . $query_cond . $query_limit);

$color = 'light';

foreach($applicants as $applicant) { 		
	$color = $color == 'light'? 'dark' : 'light';
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
				echo "<a href='getFile.php?FileName=" . $pdftitle . "&FileType=application' target='_blank'>" . $applicant['applicant_name'] . "</a>";
			} else {
				echo $applicant['applicant_name'];
			}		
 			?> 				
		</td>

		<!-- academic info -->
		<td><?php echo $applicant['academic_program'] . ' ' . get_academic_name($appliedProgram['academic_program']); ?></td>
		<td><?php echo $applicant['application_submit_date'] ?></td>
		<td><?php echo $applicant['start_semester'] ?></td>
		<td><?php echo $applicant['start_year'] ?></td>
		
		<td><?php echo ($applicant['application_fee_payment_status'] == 'Y') ? "yes" : "no"; ?></td>
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
	echo '**&&%%&&**' . pagination(" `applicant_academic` WHERE 1 " . $query_cond, 20, $_POST['page']);

?>	
