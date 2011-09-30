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

//Get reference information
$references1 = $db->query("SELECT applicant_id, reference1_filename as reference_filename, reference1_first as reference_first, reference1_last as reference_last, reference1_email as reference_email  FROM applicants");
$references2 = $db->query("SELECT applicant_id, reference2_filename as reference_filename, reference2_first as reference_first, reference2_last as reference_last, reference2_email as reference_email  FROM applicants");
$references3 = $db->query("SELECT applicant_id, reference3_filename as reference_filename, reference3_first as reference_first, reference3_last as reference_last, reference3_email as reference_email  FROM applicants");
$referencesX = $db->query("SELECT applicant_id, reference_filename,						   reference_first,					 reference_last,					reference_email,					 FROM extrareferences");

$all_references = array_merge($references1, $references2, $references3, $referencesX);



if( 'sort_by' )
//sort_array($all_references, $_POST['sort_by'], $_POST['sort_type']);
sort_array($all_references, 'applicant_id', "DESC", 'numeric');


//Order by

$curr_id = -1;
$color = 'light';
$count = 0;
$csv_data = Array();

foreach($all_references as $reference) {
	
	//toogle colors based on user
	if($curr_id != $reference['applicant_id']) {
		$color = $reference['applicant_id']%2 == 0 ? 'dark' : 'light';
	}
	
	$curr_id = $reference['applicant_id'];
	
	// Construct Applicant Name
	$applicant = $db->query("SELECT * FROM applicants WHERE applicant_id = " . $reference['applicant_id']);
	$applicant = $applicant[0];
	$applicant_name = '';
	if($applicant['given_name'] != '') {
		$applicant_name .= $applicant['given_name'] . " ";
	}
	if($applicant['middle_name'] != '') {
		$applicant_name .= $applicant['middle_name'] . " ";
	}
	$applicant_name .= $applicant['family_name'];
	
	
	//=== Filters ===
	if( filter_set($reference, 'contained', 	Array('reference_email', 'applicant_id'))
		 || $_POST['reference_name'] != '' && preg_match('/'.$_POST['reference_name'].'/i', $reference['reference_first'] . " " . $reference['reference_last']) === 0
		 || $_POST['applicant_name'] != '' && preg_match('/'.$_POST['applicant_name'].'/i', $applicant_name) === 0
		 ) continue;

	//check date
	$date = $reference['reference_filename'] ? current(explode('.', end(explode('_', $reference['reference_filename'])))) : "";  //Format is UMGradRec_2_BakerTim_09-25-2011.pdf
	if($date != "") {
		$items = explode('-', $date);
		$date = $items[2] . "-" . $items[0] . "-" . $items[1];
	}
	if( 
		!check_in_range( $_POST['recommender_submit_date-from'], $_POST['recommender_submit_date-to'], $date ) 
		&& $_POST['recommender_submit_date-to']		!=''
		&& $_POST['recommender_submit_date-from']	!=''
		){
		continue;
	}
		 		 
	// Check for blank reference
	if( $reference['reference_email'] == "" && $reference['reference_last'] == "" && $reference['reference_first'] == "")
		continue;
		
	$count++;
	//If over SEARCH_LIMIT stop displaying
	if($count > $_POST['limit'] && $_POST['limit'] > 0) {
		break;
	}
	
	//Build output data
	$output_data = Array();
	$output_data[] = ($reference['reference_filename']) ? "<a href='getFile.php?FileName=" . $reference['reference_filename'] . "&FileType=LOR' target='_blank'>$date</a>" : "";
	$output_data[] = $reference['applicant_id'];
	$output_data[] = $applicant_name;
	$output_data[] = $reference['reference_first'] . " " . $reference['reference_last'];
	$email = $reference['reference_email'];
	$output_data[] = "<a href='mailto:$email'>$email</a>";
	if( !isset($_GET['mode']) ) {
		// Web Mode
?>
	<tr class='<?php echo $color;?>' id='reference_data'>
		<?php 
			foreach($output_data as $item) {
				echo "<td>$item</td>";
			}
		?>
	</tr>

<?php 
	} else if($_GET['mode'] == 'csv') {
		$csv_data[] = $output_data;
	}//end mode processing

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

//Output CSV to screen
if($_GET['mode'] == 'csv') {
	$fp = fopen('file.csv', 'w');

	foreach ($csv_data as $fields) {
    	fputcsv($fp, $fields);
	}

	fclose($fp);	
	
	header('Content-type: text/csv');
	//open/save dialog box
	header('Content-Disposition: attachment; filename="recommender.csv"');
	//read from server and write to buffer
	readfile('file.csv');
}
	
} else {//end check ses vars
	echo "login";
}
?>