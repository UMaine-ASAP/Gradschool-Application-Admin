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


//build query
$qry = "SELECT academic_index, active, academic_program, academic_dept_code, academic_dept, academic_degree, nebhe_ct, nebhe_ma, nebhe_nh, nebhe_ri, nebhe_vt FROM um_academic";

$programs = $db->query($qry);




/* =========== */
// Sort Data
/* =========== */

sort_array($programs, $_POST['sort_by'], $_POST['sort_type']);

/* =========== */
// Process
/* =========== */

$color = 'light';
foreach($programs as $program) { 
	
	
	if( filter_set($program, 'direct', 	Array('active', 'academic_degree', 'nebhe_ct', 'nebhe_ma', 'nebhe_nh', 'nebhe_ri', 'nebhe_vt'))
		|| filter_set($program, 'contained', Array('academic_program', 'academic_dept_code', 'academic_dept'))
		) continue;
		
		
		//$program = strip_numeric_indexes($program);

	
	$color = $color == 'light'? 'dark' : 'light';
?>
	<tr class='<?php echo $color;?>' id='program-<?php echo $program['academic_index']?>'>
<!--  	<td><?php echo ''?></td>-->	
		<td class='center' >
			<!-- <input type='checkbox' <?php if($program['active'] == 'yes') echo 'checked';?> value='yes'/> -->
			<?php echo $program['active']; ?>
		</td>
		<td><?php echo $program['academic_program']?></td>
		<td><?php echo $program['academic_dept_code']?></td>
		<td><?php echo $program['academic_dept']?></td>
		<td><?php echo $program['academic_degree']?></td>
		<td class='center' ><?php echo $program['nebhe_ct']?></td>
		<td class='center' ><?php echo $program['nebhe_ma']?></td>
		<td class='center' ><?php echo $program['nebhe_nh']?></td>
		<td class='center' ><?php echo $program['nebhe_ri']?></td>
		<td class='center' ><?php echo $program['nebhe_vt']?></td>		
		
		<!-- Delete option -->
 		<td class="ui-state-default ui-corner-all edit-program-icon" title="edit program">
			<span class="ui-icon ui-icon-pencil"></span>
		</td> 
	</tr>

<?php } ?>
<script>
var program_id = -1;

$('.ui-state-default').hover( function() { $(this).addClass('ui-state-hover'); }, function() { $(this).removeClass('ui-state-hover'); });

$(document).ready( function() {
	<?php
		$new_program_form = get_include_contents( "../pages/add_info.php");
//		print $new_program;
		print "<div id='edit-program' title='Edit this program?'><p>$new_program_form</p></div>";
?>

	$( "#edit-program" ).dialog({
			resizable: false,
			height:160,
			modal: true,
			autoOpen: false,
			buttons: {
				"Edit this Program": function() {
					var parameters = {
						"applicant_id" : 		'',
						"active" : 				'',
						"academic_program" : 	'',
						"academic_dept_code" :  '',
						"academic_dept" : 	 	'',
						"academic_degree" :  	'',
						"NEBHE_CT" :		 	''				
					};
				 
					$.ajax({
						url: "<?php echo $GLOBALS['APPMANAGER_ROOT'];?>scripts/editProgram.php",
						type:'POST',
						data: parameters,
						success: function(data){
							alert(data);
						}
					});

					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			} // End Butons
	});
	
	$('.edit-program-icon').click( function() {
		var id = $(this).parent().attr('id');
		program_id = parseFloat( id.substring(8)) ;
		$('#edit-program').dialog("open");
	});
	
	
});
</script>
<?php

} else {//end check ses vars
	echo "login";
}
?>