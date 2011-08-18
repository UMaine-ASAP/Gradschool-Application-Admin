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

//build query
$qry = "SELECT academic_program, academic_dept_code, academic_dept, academic_degree, nebhe_ct, nebhe_ma, nebhe_nh, nebhe_ri, nebhe_vt FROM um_academic WHERE 1=1 "; //use dummy value so WHERE is in starting statement -- Tim 3/12/11

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
	
	
	if( filter_set($program, 'direct', 	Array('academic_degree', 'nebhe_ct', 'nebhe_ma', 'nebhe_nh', 'nebhe_ri', 'nebhe_vt'))
		|| filter_set($program, 'contained', Array('academic_program', 'academic_dept_code', 'academic_dept'))
		) continue;
		
		
		$program = strip_numeric_indexes($program);

	
	$color = $color == 'light'? 'dark' : 'light';
?>
	<tr class='<?php echo $color;?>'>
		<?php
		foreach($program as $output) { ?>
			<td><?php echo $output ?></td>
		<?php } ?>
		
		<!-- Delete option -->
		<td class="ui-state-default ui-corner-all remove-row" title="delete program">
			<span class="ui-icon ui-icon-trash"></span>
		</td>
	</tr>

<?php } ?>
<script>
var program_id = -1;

$('.ui-state-default').hover( function() { $(this).addClass('ui-state-hover'); }, function() { $(this).removeClass('ui-state-hover'); });


$(document).ready( function (){
	$('#main').append('<div id="trash-program" title="Delete this program?"><p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>These items will be permanently deleted and cannot be recovered. Are you sure?</p></div>');


	$( "#trash-program" ).dialog({
			resizable: false,
			height:140,
			modal: true,
			autoOpen: false,
			buttons: {
				"Delete this Program": function() {
				
				$.ajax({
					url: "scripts/removeProgram.php",
					type:'POST',
					data:'academic_program=' + program_id,
					success: function(data){
						alert(data);
					}
				});
					//window.location.reload();
					$( this ).dialog( "close" );
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			}
	});
	
	$('.remove-row').click( function() {
		program_id = $(this).parent().children('td:first-child').html();
		$('#trash-program').dialog("open");
	});
	
	
});
</script>
<?php

}// end user check
?>