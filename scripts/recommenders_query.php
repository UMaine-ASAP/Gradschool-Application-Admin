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

	// Check for submitted test
 		if( $_POST['submitted'] != "-") {
			if($_POST['submitted'] == 'yes' && $reference['reference_filename'] == "") {
				continue;
			} else if($_POST['submitted'] == 'no' && $reference['reference_filename'] != "") {
				continue;
			}
		}
		 
	// Check for blank reference
	if( $reference['reference_email'] == "" && $reference['reference_last'] == "" && $reference['reference_first'] == "")
		continue;
		 
?>

	<tr class='<?php echo $color;?>' id='reference_data'>
		<td><?php 
			if ($reference['reference_filename']) {
				$date = explode('.', end(explode('_', $reference['reference_filename'])))[0]; //Format is UMGradRec_2_BakerTim_09-25-2011.pdf
				echo "<a href='getFile.php?FileName=" . $reference['reference_filename'] . "&FileType=LOR' target='_blank'>$date</a>";
			}
		?></td>
		
		<td><?php echo $reference['applicant_id']; ?></td>
		<td><?php echo $applicant_name; ?></td>

		<td><?php echo $reference['reference_first'] . " " . $reference['reference_last']  ?></td>
		
		<td>
			<?php 
				$email = $reference['reference_email'];				
				echo "<a href='mailto:$email'>$email</a>";				
			?>
		</td>		
	</tr>

<?php 
}//end loop processing

} else {//end check ses vars
	echo "login";
}
?>