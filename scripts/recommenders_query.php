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



// ====== //
// Build Query
$db = Database::get();

//Get reference information
$query = "SELECT * FROM  `applicant_references`  WHERE 1 ";
$query_cond = "";

// Filters
$query_cond .= buildQuery('direct', "application_payment_method", $db);
$query_cond .= buildQuery('contained', "reference_name", $db);
$query_cond .= buildQuery('contained', "applicant_name", $db);
$query_cond .= buildQuery('contained', "reference_email", $db);
$query_cond .= buildQuery('contained', "applicant_id", $db);

//Handle the dropdown box for online vs offline submissions
switch($_POST['reference_online']){
	case('Online'):
		$query_cond .= " AND reference_online = 1";
		break;
	case('Not Online'):
		$query_cond .= " AND reference_online = 0";
		break;
}


//Deal with date
if( $_POST['recommender_submit_date-from'] != '' && $_POST['recommender_submit_date-to'] != '') {
	$date_from = $db->escape($_POST['recommender_submit_date-from']);
	$date_to   = $db->escape($_POST['recommender_submit_date-to']);
	$query_cond .= "AND DATE(recommendation_submission_date) >= DATE('$date_from') AND DATE(recommendation_submission_date) < DATE('$date_to')";
}

$query_cond .= " AND (reference_name != '' OR reference_email != '')";

//Order Data
if($_POST['sort_by'] == '' && $_POST['sort_type'] == '' ) {
	$query_cond .= " ORDER BY applicant_id ASC ";
} else {
	$sort_by   = $db->escape($_POST['sort_by']);
	$sort_type = $db->escape($_POST['sort_type']);	
	$query_cond .= " ORDER BY $sort_by $sort_type";
}

//limit display and deal with pages
$page  = (int) (!isset($_POST["page"])  ? 1  : $db->escape($_POST["page"]) );
$limit = (int) (!isset($_POST["limit"]) ? 20 : $db->escape($_POST["limit"]) );;
$startpoint =  ($page * $limit) - $limit ;

$query_limit = " LIMIT $startpoint, $limit ";


$all_references = $db->query( $query . $query_cond . $query_limit );

//print "<tr><td>$query $query_cond</td></tr>";

$curr_id = -1;
$color = 'light';

foreach($all_references as $applicant_reference) {	
	if($curr_id == -1)
		$curr_id = $applicant_reference['applicant_id'];	
	
	//toogle colors based on user
	if($curr_id != $applicant_reference['applicant_id']) {
		$color = ($color == 'light') ? 'dark' : 'light';
		$curr_id = $applicant_reference['applicant_id'];
	}
	
	//Build output data
	$output_data = Array();
	$output_data[] = $applicant_reference['reference_online'];
	$output_data[] = ($applicant_reference['recommendation_submission_date'] != "0000-00-00") ? $applicant_reference['recommendation_submission_date'] : "";
	$output_data[] = $applicant_reference['applicant_id'];
	$output_data[] = $applicant_reference['applicant_name'];
	$output_data[] = $applicant_reference['reference_name'];
	$email = $applicant_reference['reference_email'];
	$output_data[] = $email;


	// Web Mode
?>
	<tr class='<?php echo $color;?>' id='reference_data'>
		<?php 
			$ct = 0;
			foreach($output_data as $item) {
				if($ct == 1) {
					echo "<td>
							<a href='getFile.php?FileName=" . $applicant_reference['reference_filename'] . "&FileType=LOR' target='_blank'>$item</a>
						</td>";
				} else if($ct == 5) {
					echo "<td>
							<a href='mailto:$item'>$item</a>
						</td>";
				} else if($ct == 0) {
					echo "<td>";
						if($item == 0){
							echo "Not Online";
						}
						else if($item == 1){
							echo "Online";
						}
						else {
							echo "";
						}
					echo "</td>";
				}

				else {
					echo "<td>$item</td>";
				}
				$ct++;
			}
		?>
	</tr>

<?php 

}//end loop processing

?>

<script>
$('#display-all-results').click( function() {
	loadPage('recommenders', -1);
});

$('#limit-search-results').click( function() {
	loadPage('recommenders');
});

</script>
<?php
	echo '**&&%%&&**' . pagination(" `applicant_references` WHERE 1 " . $query_cond, $limit, $page);


?>
